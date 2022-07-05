const axios = require('axios')
module.exports = async function (context, req) {
  context.log('JavaScript HTTP trigger function processed a request.')

  const id = req.query.id
  context.log('id is ', id)
  context.log('product detail uri', process.env.ProductDetailUrl)

  let responseData = {}
  if (id) {
    try {
      const datas = await Promise.all([
        axios.get(`${process.env.ProductDetailUrl}/api/productdetail/${id}`),
        axios.get(`${process.env.ReviewsUrl}/api/reviews/${id}`),
        axios.get(`${process.env.StockUrl}/api/stock/${id}`),
      ])
      datas.forEach(({ data }) => {
        Object.assign(responseData, data)
      })
    } catch (e) {
      context.log('errr', e)
    }
    context.res = {
      // status: 200, /* Defaults to 200 */
      body: responseData,
    }
  }
  context.res = {
    status: 400,
    body: 'Bad request',
  }
}
