const HuntSelector = ({ selectedHuntId, hunts, selectHunt }) => {
  let hunt_ids = Object.keys(hunts)
  return (
    <select onChange={selectHunt} value={selectedHuntId}>
      { hunt_ids.map(id => <option key={id} value={id}>{hunts[id].name}</option>)}
    </select>
  )
}
