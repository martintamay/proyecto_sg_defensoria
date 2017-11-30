import React from 'react';

const DescripcionTurno = ({turno, onDelete}) => {
  if (onDelete) {
    return (
      <span className="texto-12">
        * {turno.user_name}
        <button className="btn btn-default" onClick={()=>{onDelete(turno);}}>
          <i className="fa fa-trash" aria-hidden="true"  ></i>
        </button>
        <br />
      </span>
    );
  }else{
    return <span className="texto-12">{turno.user_name}<br /></span>
  }
};

export default DescripcionTurno;
