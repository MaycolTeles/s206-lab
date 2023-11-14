describe('Teste 1: Pesquisar vídeo sobre minecraft', () => {
    it('Deve exibir resultados de pesquisa para um vídeo existente de minecraft', () => {
      cy.visit('https://www.youtube.com/');
      cy.get('input[name="search_query"]', {timeout: 20000}).type('Minecraft');
      cy.get('button[id="search-icon-legacy"]').click();
      cy.get('#video-title').should('be.visible');
    });
  });

describe('Teste 2: Reproduzir um vídeo', () => {
    it('Deve iniciar a reprodução de um vídeo selecionado', () => {
        cy.visit('https://www.youtube.com/');
        cy.get('#video-title', {timeout: 20000}).first().click();
        cy.get('video').should('be.visible');
    });
});

describe('Teste 3: Abrir página de shorts', () => {
    it('Deve navegar para a página de shorts', () => {
      cy.visit('https://www.youtube.com/');
      cy.get('a[id="endpoint"]', {timeout: 20000}).contains('Shorts').click();
      cy.url().should('include', '/shorts');
    });
  });

describe('Teste 4: Deve abrir a página de subscriptions', () => {
    it('Deve abrir a página de subscriptions', () => {
      cy.visit('https://www.youtube.com');
      cy.get('a[id="endpoint"]', {timeout: 20000}).contains('Subscriptions').click();
      cy.url().should('include', '/feed/subscriptions');
    });
});

describe('Teste 5: Abrir a página you', () => {
    it('Deve navegar para a página you', () => {
      cy.visit('https://www.youtube.com/');
      cy.get('a[id="endpoint"]', {timeout: 20000}).contains('You').click();
      cy.url().should('include', '/feed/you');
    });
});

describe('Teste 6: Tentar reproduzir um vídeo inexistente', () => {
    it('Não deve iniciar a reprodução de um vídeo inexistente', () => {
      cy.visit('https://www.youtube.com/');
      cy.get('#video-title', {timeout: 40000}).last().click(); // Supondo que o último vídeo não exista
      cy.get('video').should('not.exist');
    });
});
