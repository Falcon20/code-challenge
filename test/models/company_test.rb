require "application_system_test_case"
require "test_helper"

class CompanyTest < ApplicationSystemTestCase

  test 'company_create' do
    company = companies(:hometown_painting)

    assert_equal true, company.valid?
  end

  test 'company_without_zip_code' do
    company = companies(:armstrong_painting)

    assert_nil company.zip_code
    assert_equal false, company.valid?
  end

  test 'company_with_invalid_zip' do
    company = companies(:invalid_zip_company)

    assert_equal false, company.valid?
  end

  test 'company_without_name' do
    company = companies(:nameless_company)

    assert_nil company.name
    assert_equal false, company.valid?
  end

  test 'company_with_invalid_email' do
    company = companies(:thompson_painting)

    assert_nil  company.email.match(/\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/)
    assert_equal false, company.valid?
  end
end
