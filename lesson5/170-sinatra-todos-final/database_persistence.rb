require 'pg'

class DatabasePersistence
  def initialize(logger)
    @db = PG.connect(dbname: 'todos')
    @logger = logger
  end

  def find_list(id)
    sql = "SELECT * FROM lists WHERE id = $1"
    result = query(sql, id)

    row = result.first
    list_id = row['id'].to_i
    todos = get_todos(list_id)

    { id: list_id, name: row['name'], todos: todos }
  end

  def all_lists
    sql = "SELECT * FROM lists"
    result = query(sql)

    result.map do |row|
      list_id = row['id'].to_i
      todos = get_todos(list_id)
      { id: list_id, name: row['name'], todos: todos }
    end
  end

  def create_new_list(list_name)
    sql = "INSERT INTO lists (name) VALUES ($1)"
    query(sql, list_name)
  end

  def update_list_name(id, new_name)
    sql = "UPDATE lists SET name = $1 WHERE id = $2"
    query(sql, new_name, id)
  end

  def delete_list(id)
    sql = "DELETE FROM lists WHERE id = $1"
    query(sql, id)
  end

  def create_new_todo(list_id, text)
    sql = "INSERT INTO todos (name, list_id) VALUES ($1, $2)"
    query(sql, text, list_id)
  end

  def update_todo_status(list_id, todo_id, new_status)
    sql = "UPDATE todos SET completed = $1 WHERE id = $2"
    query(sql, new_status, todo_id)
  end

  def delete_todo(list_id, todo_id)
    sql = "DELETE FROM todos WHERE id = $1"
    query(sql, todo_id)
  end

  def mark_all_todos_complete(list_id)
    sql = "UPDATE todos SET completed = true WHERE list_id = $1"
    query(sql, list_id)
  end

  private

  def query(statement, *params)
    @logger.info "#{statement}: #{params}"
    @db.exec_params(statement, params)
  end

  def get_todos(list_id)
    sql = "SELECT * FROM todos WHERE list_id = $1"
    result = query(sql, list_id)

    result.map do |row|
      { id: row['id'].to_i,
        name: row['name'],
        completed: row['completed'] == 't'
      }
    end
  end
end