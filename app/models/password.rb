class Password
  attr_reader :password, :required_checks

  def initialize(password = '', required_checks = 2)
    @password = password
    @required_checks = required_checks
  end

  def valid?
    return false unless password
    checks.select { |check| check == true }.length >= required_checks
  end

  private

  def checks
    [integer_check, length_check, uppercase_check]
  end

  def integer_check
    password.match(/\d/).present?
  end

  def length_check
    password.length >= 8
  end

  def uppercase_check
    password.match(/[A-Z]/).present?
  end
end
