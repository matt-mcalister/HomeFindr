const ListingItem = ({ listing }) => {
  return (
    <div className="listing-item">
      <a href={listing.url}><h3>{listing.street_address}</h3></a>
      <h3>{listing.city}, {listing.state} {listing.zip_code}</h3>
      <h4>{listing.neighborhood} | ${listing.price} </h4>
      <h4>{listing.num_beds} beds | {listing.num_bath} baths</h4>
      <ul className="amenities">
      {listing.no_fee && <li>No Fee</li>}
      {listing.dishwasher && <li>Dishwasher</li>}
      {listing.guarantors_accepted && <li>Guarantors Accepted</li>}
      {listing.outdoor_space && <li>Outdoor Space</li>}
      {listing.laundry_in_unit && <li>Laundry in Unit</li>}
      {listing.laundry_in_building && <li>Laundry in Building</li>}
      {listing.doorman && <li>Doorman</li>}
      {listing.package_handling && <li>Package Handling</li>}
      {listing.elevator && <li>Elevator</li>}
      {listing.gym && <li>Gym</li>}
      </ul>
    </div>
  )
}
