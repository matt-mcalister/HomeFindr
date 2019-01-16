const ListingsList = ({ listings }) => {
  return (
    <div>
      { listings.map(l => (<p key={l.id}><a  href={l.url}>{l.street_address}</a></p>))}
    </div>
  )
}
