const HuntsPage = ({ hunts }) => {
  let huntIds = Object.keys(hunts)
  return (
    <div className="page-content hunts">
      { huntIds.map(id => <EditHunt key={id} hunt={hunts[id]}/>)}
    </div>
  )
}
