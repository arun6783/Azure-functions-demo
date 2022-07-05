const axios = require('axios').default
module.exports = async function (context, req) {
  context.log('JavaScript HTTP trigger function processed a request.')

  const id = req.query.id
  if (id) {
    let result = []

    const datas = await Promise.all(
      getProductDetail(id),
      getReviews(id),
      getStock(id)
    )

    datas.forEach(({ data }) => {
      result = [...result, data]
    })

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
