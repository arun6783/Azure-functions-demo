const express = require('express')
const products = require('./data/products')
const app = express()
const port = 4500

app.get('/api/reviews/:id', (req, res) => {
  console.log('products', products)
  const product = products.find((x) => {
    return x.id == req.params.id
  })

  if (product) {
    console.log('product found', product)

    const numReviews = product?.numReviews || undefined
    const rating = product?.rating || undefined
    if (numReviews && rating) {
      return res.status(200).send({ rating, numReviews })
    }
  }
  return res.status(400).send({ error: 'Item not found' })
})
app.listen(port, () => console.log(`Reviews MX app listening on port ${port}!`))
