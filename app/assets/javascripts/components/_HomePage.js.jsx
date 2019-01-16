class HomePage extends React.Component {

  constructor(props){
    super(props)
    this.state = {
      selectedHuntId: props.selectedHuntId,
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
    let listings = this.state.hunts[this.state.selectedHuntId].listings
    return listings
  }

  sorted(listings){
    return listings
  }

  render() {
    console.log(this.state);
    return (
      <div className="page-content home">
        <HuntSelector selectedHuntId={this.state.selectedHuntId} hunts={this.state.hunts} selectHunt={this.selectHunt}/>
        <ListingsList listings={this.sorted(this.filtered())}/>
      </div>
    )
  }
}
