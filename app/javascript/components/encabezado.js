import React from 'react';

const Encabezado = ({mes, anho, onChangeMonth}) => {
  const t_meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio',
    'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
  let mes_letras = t_meses[mes-1];
  if (!mes_letras) {
    mes_letras = "Cargando...";
    anho = "";
  }
  return (
    <div className="encabezado">
      <div className="month">
       <ul>
         <li className="prev" onClick={() => {onChangeMonth('-')}}>&#10094;</li>
         <li className="next" onClick={() => {onChangeMonth('+')}}>&#10095;</li>
         <li>
           {mes_letras}<br />
           <span>{anho}</span>
         </li>
       </ul>
      </div>
      <div className="weekdays row">
        <div className='weekday col-md-1 col-sm-1'>Domingo</div>
        <div className='weekday col-md-1 col-sm-1'>Lunes</div>
        <div className='weekday col-md-1 col-sm-1'>Martes</div>
        <div className='weekday col-md-1 col-sm-1'>Miercoles</div>
        <div className='weekday col-md-1 col-sm-1'>Jueves</div>
        <div className='weekday col-md-1 col-sm-1'>Viernes</div>
        <div className='weekday col-md-1 col-sm-1'>Sábado</div>
      </div>
    </div>
  );
}


export default Encabezado;
