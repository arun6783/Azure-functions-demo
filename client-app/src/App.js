import { BrowserRouter as Router, Route } from 'react-router-dom'

import { Container } from 'react-bootstrap'
import Home from './Pages/Home'
import ProductDetail from './Pages/ProductDetail'
import NotFound from './Pages/NotFound'

function App() {
  return (
    <Router>
      <main className="py-3">
        <Container>
          <Route path="/product/:id" component={ProductDetail} />
          <Route path="/" component={Home} exact />
          <Route path="/404" component={NotFound} />
        </Container>
      </main>
    </Router>
  )
}

export default App
