const ListingsList = ({ listings }) => {
  return (
    <div className="box-list">
      { listings.map(l => (<ListingItem listing={l} key={l.id}/>))}
    </div>
  )
}
