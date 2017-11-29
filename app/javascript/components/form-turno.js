import React from 'react'
import Modal from 'react-modal';
import DescripcionTurno from './descripcion_turno'

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)'
  }
};

const FormTurno = ({open, dia, turnos, closeModal, deleteTurno, saveTurno}) => {

  let listaTurnos = [];
  if (turnos) {
    listaTurnos = turnos.map((turno)=>{
      return (
        <div>
          <DescripcionTurno turno={turno} onDelete={deleteTurno} key={turno.dia+"-"+turno.id} />
        </div>
      );
    });
  }else{
    listaTurnos = <span>Sin turnos para mostrar</span>;
  }

  return(
    <div>
      <Modal
        isOpen={open}
        onRequestClose={closeModal}
        style={customStyles}
        contentLabel="Edición de Turno"
      >
        <div className="form-group">
          <div className="table-group">
            <div className="table table-heading">
              <button className="btn btn-default pull-right" onClick={closeModal}>
                <i className="fa fa-times" aria-hidden="true"></i>
              </button>
              <h1>Defensores</h1>
            </div>
            <div className="table table-body">
              {listaTurnos}
            </div>
            <div className="table table-heading">
              <h1>Nuevo Defensor</h1>
            </div>
            <div className="table table-body">
              <input type="text" id="nombre-defensor" placeholder="Nombre Defensor" className="input"></input>
              <span className="buttons-group" id='botones'>
                <button className="btn btn-default">
                  <i className="fa fa-floppy-o" aria-hidden="true" onClick={() => saveTurno(nombreDefensor, dia)}></i>
                </button>
              </span>
            </div>
          </div>
        </div>
      </Modal>
    </div>
  );
}

export default FormTurno;
