import React from 'react'
import { Link } from 'react-router-dom'

const NotFound = () => {
  return (
    <div>
      <h2>Product not found!!!</h2>
      <Link className="mx-3" to="/">
        Go Back
      </Link>
    </div>
  )
}

export default NotFound
