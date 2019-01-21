class HuntsPage extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      hunts: props.hunts,
      newHunt: ""
    }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleChange(e){
    this.setState({
      newHunt: e.target.value
    })
  }

  handleSubmit(e){
    e.preventDefault()
    console.log(BASE_URL);
    console.log(this.state.newHunt);
  }

  render(){
    let huntIds = Object.keys(this.state.hunts)
    return (
      <div className="page-content hunts">
        <form onSubmit={this.handleSubmit}>
          <label htmlFor="newHunt">Create Hunt:</label>
          <input type="text" name="newHunt" value={this.state.newHunt} onChange={this.handleChange} />
          <input type="submit" />
        </form>
        <div className="box-list">
          { huntIds.map(id => <EditHunt key={id} hunt={this.state.hunts[id]}/>)}
        </div>
      </div>
    )
  }
}
