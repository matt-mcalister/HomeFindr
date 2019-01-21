const HuntsPage = ({ hunts }) => {
  return (
    <div className="page-content hunts">
      { hunts.map(h => <EditHunt key={h.id} hunt={h}/>)}
    </div>
  )
}
