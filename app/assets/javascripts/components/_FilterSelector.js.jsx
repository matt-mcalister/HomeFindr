const labels = {
  all: "All",
  no_fee: "No Fee",
  dishwasher: "Dishwasher",
  guarantors_accepted: "Guarantors Accepted",
  outdoor_space: "Outdoor Space",
  laundry_in_unit: "Laundry In Unit",
  laundry_in_building: "Laundry In Building",
  doorman: "Doorman",
  package_handling: "Package Handling",
  elevator: "Elevator",
  gym: "Gym",
}


const FilterSelector = ({ filterBy, setFilter }) => {
  let filterAttrs = Object.keys(filterBy)
  return (
    <div id="filter-checks">
    { filterAttrs.map(attr => {
      return (
        <div key={attr}>
          <label htmlFor={attr}>{labels[attr]}</label>
          <input type="checkbox" name={attr} checked={filterBy[attr]} onChange={e => setFilter(attr)}/>
        </div>
      )
    }) }
    </div>
  )
}
