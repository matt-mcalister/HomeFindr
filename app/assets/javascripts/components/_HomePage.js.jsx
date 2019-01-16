class HomePage extends React.Component {

  constructor(props){
    super(props)
    this.state = {
      selectedHuntId: props.hunts[props.hunts.length-1].id,
      hunts: props.hunts,
      filterBy: {},
      sortBy: "all"
    }
    this.selectHunt = this.selectHunt.bind(this)
  }

  selectHunt(e){
    const id = parseInt(e.target.value, 10)
    this.setState({
      selectedHuntId: id
    })
  }

  filtered(){
    return {}
  }

  sorted(listings){
    return listings
  }

  render() {
    console.log(this.props);
    return (
      <div className="page-content home">
        <HuntSelector selectedHuntId={this.state.selectedHuntId} hunts={this.state.hunts} selectHunt={this.selectHunt}/>
        <ListingsList listings={this.sorted(this.filtered())}/>
      </div>
    )
  }
}
