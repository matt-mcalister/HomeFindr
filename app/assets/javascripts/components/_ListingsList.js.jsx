const ListingsList = ({ listings }) => {
  return (
    <div>
      { listings.map(l => (<ListingItem listing={l} key={l.id}/>))}
    </div>
  )
}
