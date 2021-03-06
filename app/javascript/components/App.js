import React from "react"
import PropTypes from "prop-types"
import $ from 'jquery'
import Encabezado from './encabezado.js'
import ListaTurnos from './lista_turnos.js'
import FormTurno from './form-turno.js'

const linkRecurso = "http://localhost:3000/shifts";
const linkUsuarios = "http://localhost:3000/users";

class App extends React.Component {
  constructor(props){
    super(props);

    let fechaActual = new Date();
    const mes = fechaActual.getMonth()+1, anho = fechaActual.getFullYear();

    this.state = {
      mes: mes,
      anho: anho,
      turnos: [],
      usuarios: [],
      editando: false,
      dia_editandose: [],
      ndia_editandose: 0
    };

    this.changeDate = this.changeDate.bind(this);
    this.getTurnos = this.getTurnos.bind(this);
    this.openModal = this.openModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
    this.deleteTurno = this.deleteTurno.bind(this);
    this.saveTurno = this.saveTurno.bind(this);
    this.getUsuarios = this.getUsuarios.bind(this);


    this.getTurnos();
    this.getUsuarios();
  }

  /**
  * Metodo encargado de solicitar al servidor los usuarios de manera asincrona
  */
  getUsuarios(){
    $.getJSON(linkUsuarios+'.json', (response) => {
      //se guardan los datos
      this.setState({
        usuarios: response
      })
    });
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
      dia_editandose: this.state.turnos[dia-1],
      ndia_editandose: dia
    });
    this.openModal();
  }

  openModal() {
    this.setState({editando: true});
  }
  closeModal() {
    this.getTurnos();
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
    console.log(linkRecurso+"/"+turno.id+".json");
    $.ajax({
      url: linkRecurso+"/"+turno.id+".json",
      type: 'DELETE',
      data: {},
      success: (response) => {
        alert("Turno Eliminado");
      }
    });
    this.closeModal();

  }

  saveTurno(defensor, dia, mes, anho){
    //guardar
    console.log(`Guardar ${defensor} en fecha ${dia}-${mes}-${anho}`);
    $.ajax({
      url: linkRecurso+".json",
      type: 'POST',
      data: { shift: { shift_date: `${dia}-${mes}-${anho}`, user_id: defensor } },
      success: (response) => {
        alert("Turno Guardado");
      }
    });
    this.closeModal();

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
          deleteTurno={this.deleteTurno}
          dia={this.state.ndia_editandose}
          saveTurno={(defensor, dia)=>{this.saveTurno(defensor, dia, this.state.mes, this.state.anho)}}
          usuarios={this.state.usuarios} />
      </div>
    );
  }
}

export default App
