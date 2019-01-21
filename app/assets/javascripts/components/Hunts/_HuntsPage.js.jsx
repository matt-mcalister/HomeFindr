class HuntsPage extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      hunts: props.hunts,
      newHunt: "",
      error: false
    }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
  }

  handleChange(e){
    this.setState({
      newHunt: e.target.value
    })
  }

  handleSubmit(e){
    e.preventDefault()
    console.log(this.state.newHunt);
    fetch(BASE_URL + "/hunts", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        hunt: {
          name: this.state.newHunt
        },
        user_id: this.props.user_id
      })
    }).then(r => r.json())
      .then(json => {
        if (json.hunts) {
          this.setState({
            hunts: json.hunts,
            error: false,
          })
        } else {
          this.setState({
            error: true
          })
        }
      })
  }

  handleDelete(id){
    console.log(id);
  }

  render(){
    let huntIds = Object.keys(this.state.hunts)
    return (
      <div className="page-content hunts">
        <form onSubmit={this.handleSubmit}>
        {this.state.error && <p style={{color:"red", marginTop: 0}}>Invalid Request</p>}
          <label htmlFor="newHunt">Create Hunt:</label>
          <input type="text" name="newHunt" value={this.state.newHunt} onChange={this.handleChange} />
          <input type="submit" />
        </form>
        <div className="box-list">
          { huntIds.map(id => <EditHunt key={id} hunt={this.state.hunts[id]} handleDelete={this.handleDelete}/>)}
        </div>
      </div>
    )
  }
}
