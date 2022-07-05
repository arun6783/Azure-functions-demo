const axios = require('axios').default
module.exports = async function (context, req) {
  context.log('JavaScript HTTP trigger function processed a request.')

  const id = req.query.id
  console.log('id is ', id)

  if (id) {
    try {
      let result = []

      const datas = await Promise.all(
        getProductDetail(id),
        getReviews(id),
        getStock(id)
      )

      datas.forEach(({ data }) => {
        result = [...result, data]
      })
    } catch (e) {
      console.log('errr', e)
    }
    context.res = {
      // status: 200, /* Defaults to 200 */
      body: result,
    }
  }
  context.res = {
    status: 400,
    body: 'Bad request',
  }
}

const getProductDetail = (id) => {
  console.log('product detail uri', process.env.ProductDetailUrl)
  return axios.get(
    `http://${process.env.ProductDetailUrl}/api/productdetail/${id}`
  )
}

const getReviews = async (id) => {
  return axios.get(`http://${process.env.ReviewsUrl}/api/reviews/${id}`)
}

const getStock = async (id) => {
  return axios.get(`http://${process.env.StockUrl}/api/stock/${id}`)
}
