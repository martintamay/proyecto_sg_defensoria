import React from 'react';
import ListaTurnosItem from './lista_turnos_item';

const ListaTurnos = ({diasTurnos, anho, mes, onClickEditar}) => {
  //cuadros que se mostraran al final
  let cuadrosTurnos = [];
  //se calculan la cantidad de dias que va a tener el mes
  const d = new Date(anho, mes, 0).getDate();

  //se rellenan cuantos dias en blanco agregar para coincidir la semana
  const dia_semana = new Date(anho, mes-1, 1).getDay();
  for (var i = 0; i < dia_semana; i++) {
    cuadrosTurnos.push(
      <div className="day-item col-md-1 col-sm-1" key={'b'+i}>
      </div>
    );
  }

  //se rellena con los cuadros de las fechas
  for (var i = 0; i < d; i++) {
      cuadrosTurnos.push(
      <ListaTurnosItem
        dia={i+1}
        turnos={diasTurnos[i]}
        onClickEditar={(dia)=>{
          onClickEditar(dia);
        }}
        key={i} />
    );
  }

  return (<div className="days">
      <div className='row'>
        {cuadrosTurnos}
      </div>
    </div>);
};

export default ListaTurnos;
