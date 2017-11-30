import React, {Component} from 'react';

class SelectorUsuario extends Component {
  constructor(props) {
    super(props);

    this.state = {
      usuarios: props.usuarios,
      saveTurno: props.saveTurno,
      selectUser: 1
    };
  }

  handleChange(event){
    this.setState({ selectUser: event.target.value });
  }

  render(){
    const lUsuarios = this.state.usuarios.map((usuario) => {
      return <option key={usuario.id} value={usuario.id} > {usuario.name}</option>;
    });
    return (
      <div className="table table-body">
        <select value={this.state.selectUser} onChange={this.handleChange} >
          {lUsuarios}
        </select>
        <span className="buttons-group" id='botones'>
          <button className="btn btn-default">
            <i className="fa fa-floppy-o" aria-hidden="true" onClick={() => this.state.saveTurno(nombreDefensor, dia)}></i>
          </button>
        </span>
      </div>
    );
  }
}

export default SelectorUsuario;
