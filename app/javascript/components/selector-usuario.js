import React, {Component} from 'react';

class SelectorUsuario extends Component {
  constructor(props) {
    super(props);

    this.state = {
      usuarios: props.usuarios,
      saveTurno: props.saveTurno,
      dia: props.dia,
      selectUser: 1
    };

    this.handleChange = this.handleChange.bind(this);
    this.saveTurno = this.saveTurno.bind(this);
  }

  handleChange(event){
    this.setState({ selectUser: event.target.value });
  }

  saveTurno(){
    this.state.saveTurno(this.state.selectUser, this.state.dia);
  }

  render(){
    const lUsuarios = this.state.usuarios.map((usuario) => {
      return <option key={usuario.id} value={usuario.id} > {usuario.name}</option>;
    });
    return (
      <div className="table table-body">
        <select value={this.state.selectUser} onChange={this.handleChange} className="campo-nuevo" >
          {lUsuarios}
        </select>
        <span className="buttons-group" id='botones'>
          <button className="btn btn-default" onClick={this.saveTurno}>
            <i className="fa fa-floppy-o" aria-hidden="true" ></i>
          </button>
        </span>
      </div>
    );
  }
}

export default SelectorUsuario;
