const ListingsList = ({ listings }) => {
  return (
    <div className="listings-list">
      { listings.map(l => (<ListingItem listing={l} key={l.id}/>))}
    </div>
  )
}
