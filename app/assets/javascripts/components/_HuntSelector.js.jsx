const HuntSelector = ({ selectedHuntId, hunts, selectHunt }) => {
  return (
    <select onChange={selectHunt} value={selectedHuntId}>
      { hunts.map(h => <option key={h.id} value={h.id}>{h.name}</option>)}
    </select>
  )
}
