context('Test', () => {
  beforeEach(() => {
    cy.visit('/admin')
  })

  describe('Implicit Assertions', () => {
    it('.should() - make an assertion about the current subject', () => {
      // https://on.cypress.io/should
      cy.get('.assertion-table')
    })
  })
})