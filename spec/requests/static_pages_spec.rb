require 'spec_helper'

describe 'Static pages' do

    let (:base_title) { 'Super Duper Rails Sample App' }

    subject { page }

    shared_examples_for 'all static pages' do
        it { should have_selector('h1', text: heading) }
        it { should have_title(full_title(page_title)) }
    end

    describe 'Home page' do
        before { visit root_path }

        let (:heading) { 'Sample App' }
        let (:page_title) { '' }
        it_should_behave_like 'all static pages'

        it { should_not have_title('| Home') }
    end

    describe 'About page' do
        before { visit about_path }
        let (:heading) { 'About' }
        let (:page_title) { 'About' }
        it_should_behave_like 'all static pages'
    end

    describe 'Help page' do
        before { visit help_path }
        let (:heading) { 'Help' }
        let (:page_title) { 'Help' }
        it_should_behave_like 'all static pages'
    end

    describe 'Contact page' do
        before { visit contact_path }
        let (:heading) { 'Contact' }
        let (:page_title) { 'Contact' }
        it_should_behave_like 'all static pages'
    end

    describe 'Sign up page' do
        before { visit signup_path }
        let (:heading) { 'Sign Up' }
        let (:page_title) { 'Sign Up' }
        it_should_behave_like 'all static pages'
    end

    it 'should have the correct links in the layout' do
        visit root_path
        click_link 'About'
        expect(page).to have_title(full_title('About Us'))
        click_link 'Help'
        expect(page).to have_title(full_title('Help'))
        click_link 'Contact'
        expect(page).to have_title(full_title('Contact'))
        click_link 'Home'
        expect(page).to have_title(full_title(''))
        click_link 'Sign up now!'
        expect(page).to have_title(full_title('Sign Up'))
        click_link 'Sample App'
        expect(page).to have_title(full_title(''))
    end

    # not sure how to make this look right
    # or how to use this
    let (:pages) { {
        home: {
            path:       root_path,
            name:       'Home',
            heading:    'Sample App',
        },
        help: {
            path:       help_path,
            name:       'Help',
            heading:    'Help',
            title:      'Help',
        },
        contact: {
            path:       contact_path,
            name:       'Contact',
            heading:    'Contact',
            title:      'Contact',
        }
    } }
end
