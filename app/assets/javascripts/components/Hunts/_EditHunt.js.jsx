class EditHunt extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      newUserEmail: "",
      error: false,
      users: props.hunt.users
    }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleClick = this.handleClick.bind(this)
  }

  handleChange(e){
    this.setState({
      newUserEmail: e.target.value
    })
  }

  handleSubmit(e){
    e.preventDefault()
    fetch("/hunts/add_user", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        email: this.state.newUserEmail,
        hunt_id: this.props.hunt.id
      })
    }).then(r => r.json()
      .then(json => {
        if (json.user){

          let users = [...this.state.users, json.user]
          console.log(users);
          this.setState({
            users: users,
            error: false,
            newUserEmail: ""
          })
        } else {
          this.setState({
            error: true,
          })
        }
      }))
  }

  handleClick(e){
    this.props.handleDelete(this.props.hunt.id)
  }

  render(){
    let { name } = this.props.hunt
    return (
      <div className="box hunt">
        <div>
          <h2>{name}</h2>
          {this.state.users.map(u => <p key={u.id}>{u.username}</p>)}
          <form onSubmit={this.handleSubmit}>
          {this.state.error && <p style={{color:"red", marginTop: 0}}>User Not Found</p>}
            <label htmlFor="newUserEmail">Add User:</label>
            <input type="text" name="newUserEmail" value={this.state.newUserEmail} onChange={this.handleChange} />
            <input type="submit" />
          </form>
        </div>
        <button onClick={this.handleClick}>Delete Hunt</button>
      </div>
    )
  }
}
