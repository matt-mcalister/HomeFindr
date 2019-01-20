class HomePage extends React.Component {

  constructor(props){
    super(props)
    this.state = {
      selectedHuntId: props.selectedHuntId,
      hunts: props.hunts,
      filterBy: {
        all: true,
        no_fee: true,
        dishwasher: true,
        guarantors_accepted: true,
        outdoor_space: true,
        laundry_in_unit: true,
        laundry_in_building: true,
        doorman: true,
        package_handling: true,
        elevator: true,
        gym: true,
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
    if (attr === "all") {
      this.setState({
        filterBy: {
          all: true,
          no_fee: true,
          dishwasher: true,
          guarantors_accepted: true,
          outdoor_space: true,
          laundry_in_unit: true,
          laundry_in_building: true,
          doorman: true,
          package_handling: true,
          elevator: true,
          gym: true,
        }
      })
    } else {
      let filterBy = {
        ...this.state.filterBy,
        all: false,
        [attr]: !this.state.filterBy[attr]
      }
      if (Object.keys(filterBy).every(attr => attr === "all" || filterBy[attr])) {
        filterBy.all = true
      }
      this.setState({
        filterBy: filterBy
      })
    }
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
