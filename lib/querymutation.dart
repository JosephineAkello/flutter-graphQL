class QueryMutation {
  String addUser(String id, String name, String email, String password) {
    return """
      mutation{
          addUser(id: "$id", name: "$name", lastName: "$email", age: $password){
            id
            name
            email
            password
          }
      }
    """;
  }

  String createUser = r'''
  mutation CreateUser($userData: UserCreateInput!){
  createUser(data: $userData){
    email,
    name,
    password,
  }
}
    ''';
  String getAllUsers = r'''
        query GetAllUsers{
          users{
            name,
            email,
            password,
            createdAt
          }
        }}
    ''';
}


