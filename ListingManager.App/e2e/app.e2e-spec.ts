import { ListingManagerAppPage } from './app.po';

describe('listing-manager-app App', () => {
  let page: ListingManagerAppPage;

  beforeEach(() => {
    page = new ListingManagerAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
