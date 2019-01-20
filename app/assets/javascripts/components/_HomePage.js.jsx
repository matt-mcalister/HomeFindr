class HomePage extends React.Component {

  constructor(props){
    super(props)
    this.state = {
      selectedHuntId: props.selectedHuntId,
      hunts: props.hunts,
      filterBy: {
        all: true,
        no_fee: false,
        dishwasher: false,
        guarantors_accepted: false,
        outdoor_space: false,
        laundry_in_unit: false,
        laundry_in_building: false,
        doorman: false,
        package_handling: false,
        elevator: false,
        gym: false,
      },
      sortBy: "all"
    }
    this.selectHunt = this.selectHunt.bind(this)
    this.setFilter = this.setFilter.bind(this)
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

  setFilter(attr){
    console.log(attr)
  }

  render() {
    console.log(this.state);
    return (
      <div className="page-content home">
        <HuntSelector selectedHuntId={this.state.selectedHuntId} hunts={this.state.hunts} selectHunt={this.selectHunt}/>
        <FilterSelector filterBy={this.state.filterBy} setFilter={this.setFilter}/>
        <ListingsList listings={this.sorted(this.filtered())}/>
      </div>
    )
  }
}
