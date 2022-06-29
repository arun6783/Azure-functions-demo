import React from 'react'
import PropTypes from 'prop-types'

const Rating = ({ rating, text, color }) => {
  function ratings() {
    var arr = []

    for (var a = 1; a < 6; a++) {
      var b = (
        <i
          key={a}
          style={{ color }}
          className={
            rating >= `${a}`
              ? 'fas fa-star'
              : rating >= `${a - 1}.5`
              ? 'fas fa-star-half-alt'
              : 'far fa-star'
          }
        />
      )
      arr.push(b)
    }
    return arr
  }
  return (
    <>
      <div className='rating'>
        <span>{ratings().map((i) => i)}</span>
        <span>{text && text}</span>
      </div>
    </>
  )
}

Rating.defaultProps = {
  color: '#f8e825',
}

Rating.protoTypes = {
  rating: PropTypes.number.isRequired,
  text: PropTypes.string.isRequired,
  color: PropTypes.string,
}
export default Rating
