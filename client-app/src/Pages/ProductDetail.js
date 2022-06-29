import React, { useState, useEffect } from 'react'
import { Card, Row, Image, ListGroup, Col } from 'react-bootstrap'

import { Link } from 'react-router-dom'
import Message from '../components/Message'
import Loader from '../components/Loader'
import Rating from '../components/Rating'

const ProductDetail = ({ match }) => {
  const loading = false
  const error = undefined
  const [product, setProduct] = useState({
    id: 2,
    name: 'DIOR Miss Dior Eau de Parfum 50ml',
    image: '/images/DIOR_Miss_Dior.png',
    description:
      "The new Miss Dior eau de parfum brings in a wave of optimism and brims with life—echoing Miss Dior's very essence. Miss Dior's fresh and floral notes are composed like a bouquet of countless flowers with endless sparkling colours. François Demachy, Perfumer-Creator of the House of Dior, wanted to create an iridescent Rose for this fragrance that is lit up by a myriad of fresh and floral notes.",
    brand: 'DIOR',
    category: 'Parfum',
    pricePer100: 166.0,
    price: 83.0,
    countInStock: 17,
    rating: 4.5,
    numReviews: 80,
  })

  const getProductDetail = async (id) => {}
  useEffect(() => {
    getProductDetail(match.params.id)
  }, [])

  return (
    <>
      {loading ? (
        <Loader></Loader>
      ) : error ? (
        <Message variant="danger">{error}</Message>
      ) : (
        product && (
          <>
            <Link className="btn btn-dark my-3" to="/">
              Back
            </Link>

            <Row>
              <Col md={6}>
                <Image src={product.image} alt={product.name} fluid="true" />
              </Col>
              <Col md={3}>
                <ListGroup variant="flush">
                  <ListGroup.Item>
                    <h3>{product.name}</h3>
                  </ListGroup.Item>
                  <ListGroup.Item>Brand: {product.brand}</ListGroup.Item>
                  <ListGroup.Item>
                    <Rating
                      rating={product.rating}
                      text={`${product.numReviews} reviews`}
                    />
                  </ListGroup.Item>
                  <ListGroup.Item>
                    Description: {product.description}
                  </ListGroup.Item>
                </ListGroup>
              </Col>
              <Col md={3}>
                <Card>
                  <ListGroup variant="flush">
                    <ListGroup.Item>
                      <Row>
                        <Col>Price:</Col>
                        <Col>
                          <strong>£{product.price}</strong>
                        </Col>
                      </Row>
                    </ListGroup.Item>
                    <ListGroup.Item>
                      <Row>
                        <Col>Status:</Col>
                        <Col>
                          {product.countInStock > 0
                            ? `${product.countInStock} In Stock`
                            : 'Out Of Stock'}
                        </Col>
                      </Row>
                    </ListGroup.Item>
                  </ListGroup>
                </Card>
              </Col>
            </Row>
          </>
        )
      )}
    </>
  )
}

export default ProductDetail
