class EditHunt extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      newUserEmail: ""
    }
  }

  handleChange(e){
    this.setState({
      newUserEmail: e.target.value
    })
  }

  handleSubmit(e){
    e.preventDefault()
    console.log(this.state.newUserEmail);
  }

  render(){
    let { name, users, id } = this.props.hunt
    return (
      <div className="edit-hunt">
        <h2>{name}</h2>
        {users.map(u => <p key={u.id}>{u.username}</p>)}
        <form onSubmit={this.handleSubmit}>
          <label htmlFor="newUserEmail">Add User:</label>
          <input type="text" name="newUserEmail" value={this.state.newUserEmail} onChange={this.handleChange} />
          <input type="submit" />
        </form>
      </div>
    )
  }
}
