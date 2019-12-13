context('Breeds', () => {
  beforeEach(() => {
    cy.visit('http://localhost:5000')
      .get('.admin-link').click()
      .get('#user_email').type('admin@example.com')
      .get('#user_password').type('password')
      .get('#session_new').submit()
      .contains('Breeds').click()
  })

  it('can create Breed', () => {
    cy.contains('New Breed').click()
      .get('#breed_name').type('TestBreed')
      .contains('Create Breed').click()
      .get('#page_title').should('have.text', 'TestBreed')
  })
})