#### Database Design

1.

INSERT INTO expenses (amount, memo, created_on) VALUES (9999.99, 'largest value', NOW());

INSERT INTO expenses (amount, memo, created_on) VALUES (10000.00, 'too big', NOW());

2.

INSERT INTO expenses (amount, memo, created_on) VALUES (-9999.99, 'smallest value', NOW());

INSERT INTO expenses (amount, memo, created_on) VALUES (-10000.00, 'smallest value', NOW());

3.

ALTER TABLE expenses ADD CONSTRAINT positive_amount CHECK (amount >= 0.01);

#### Displaying Help

1.

printing out a ruby heredoc for easier formatting of the multiline string

#### Adding Expenses

1.

inputted characters can unexpectedly be interpeted as code if not escaped

#### Handling Parameters Safely

1.

PG::ProtocolViolation: ERROR:  bind message supplies 1 parameters, but prepared statement "" requires 2

2.

def add_expense(amount, memo)
  date = Date.today
  sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
  @connection.exec_params(sql, [amount, memo, date])
end

3.

records the second argument as the memo, since all characters are now escaped