import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'
import Encabezado from './encabezado.js'
import ListaTurnos from './lista_turnos.js'
import FormTurno from './form-turno.js'

const linkRecurso = "/shifts";
class App extends React.Component {constructor(props){
    super(props);

    let fechaActual = new Date();
    const mes = fechaActual.getMonth()+1, anho = fechaActual.getFullYear();

    this.state = {
      mes: mes,
      anho: anho,
      turnos: [],
      usuarios: [],
      editando: false,
      dia_editandose: []
    };

    this.changeDate = this.changeDate.bind(this);
    this.getTurnos = this.getTurnos.bind(this);
    this.openModal = this.openModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
    this.deleteTurno = this.deleteTurno.bind(this);


    this.getTurnos();
  }

  /**
  * Metodo encargado de solicitar al servidor los turnos de manera asincrona
  */
  getTurnos(){
    const mes = this.state.mes, anho = this.state.anho;
    $.getJSON(linkRecurso+'.json', { mes: mes, anho: anho }, (response) => {
      //se guardan los datos
      this.setState({
        turnos: this.agruparTurnos(response)
      })
    });
  }

  editar(dia){
    this.setState({
      dia_editandose: this.state.turnos[dia-1]
    });
    this.openModal();
    console.log(this.state.dia_editandose);
  }

  openModal() {
    this.setState({editando: true});
  }
  closeModal() {
    this.setState({editando: false});
  }

  /**
  * Metodo encargado de los cambios de mes en el calendario
  * recibe tipo que es '+' o '-' dependiendo de si se quiere aumentar o reducir
  * un mes
  */
  changeDate(intervalo){
    let mes = this.state.mes, anho=this.state.anho;
    if (intervalo=='+') {
      if (this.state.mes==12) {
        //si le suma 1 a diciembre
        mes = 1;
        anho = anho+1;
      }else{
        mes = mes+1;
      }
    }else if(intervalo=='-'){
      if (this.state.mes==1) {
        //si le resta 1 a diciembre
        mes = 12;
        anho = anho-1;
      }else{
        mes = mes-1;
      }
    }

    //se vuelven a pedir los turnos
    this.getTurnos(mes, anho);

    //se setean los nuevos mes y anho
    this.setState({
      mes: mes,
      anho: anho
    });
  }

  /**
  * Metodo que toma los turnos recibidos de rails y los agrupa por fecha
  */
  agruparTurnos(turnos){
    let turnosAgrupados = [];
    turnos.forEach((turno) => {
      let fecha = new Date(turno.shift_date);
      if (turnosAgrupados[fecha.getDate()]) {
        turnosAgrupados[fecha.getDate()].push(turno);
      }else{
        turnosAgrupados[fecha.getDate()] = [turno]
      }
    });
    return turnosAgrupados;
  }

  deleteTurno(turno){
    //eliminar
    console.log("Eliminar "+turno.id);
  }

  saveTurno(defensor, dia){
    //guardar
    console.console.log(`Guardar ${defensor} en fecha ${dia}-${this.state.mes}-${this.state.anho}`);
  }

  render(){
    return (
      <div>
        <Encabezado
          anho={this.state.anho}
          mes={this.state.mes}
          onChangeMonth={(intervalo) => {this.changeDate(intervalo)}} />
        <ListaTurnos
          diasTurnos={this.state.turnos}
          anho={this.state.anho}
          mes={this.state.mes}
          onClickEditar={(dia)=>{this.editar(dia)}} />
        <FormTurno
          open={this.state.editando}
          closeModal={this.closeModal}
          turnos={this.state.dia_editandose}
          deleteTurno={this.deleteTurno} />
      </div>
    );
  }
}

export default App
