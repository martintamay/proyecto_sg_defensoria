import React from 'react';
import DescripcionTurno from './descripcion_turno'

const ListaTurnosItem = ({dia, turnos, onClickEditar}) => {
  let listaTurnos = [];
  if (turnos) {
    listaTurnos = turnos.map((turno)=>{
      return <DescripcionTurno turno={turno} key={turno.id} />
    });
  }

  if (listaTurnos.length>0) {
    return (
      <div className="day-item col-md-1 col-sm-1">
        <div className="panel panel-default">
          <div className="panel-heading">
            <b>{dia}</b>
          </div>
          <div className="panel-body">
            <div className="lista-turnos">{listaTurnos}</div>
          </div>
          <div className="panel-footer">
            <div
              type="button"
              className="btn btn-default btn-xs btn-editar"
              onClick={()=>{onClickEditar(dia)}} >
              Editar
            </div>
          </div>
        </div>
      </div>
    );
  }else{
    return (
      <div className="day-item col-md-1 col-sm-1">
        <div className="panel panel-default">
          <div className="panel-heading">
            <b>{dia}</b>
          </div>
          <div className="panel-footer">
            <div
              type="button"
              className="btn btn-default btn-xs btn-editar"
              onClick={()=>{onClickEditar(dia)}} >
              Editar
            </div>
          </div>
        </div>
      </div>
    );
  }
};

export default ListaTurnosItem;
