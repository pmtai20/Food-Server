
import { useEffect, useState } from 'react';
import './App.css';
import axios from 'axios';




function App() {
  const [users, setUsers] = useState([]);
  const getData = () => {
    axios.get('http://localhost:8080')
      .then((response) => {
        let responseUsers = response.data.map((responseUser) => {
          return {
            id: responseUser.id,
            name: responseUser.name,
          }
        })
        setUsers(responseUsers);
      })
      .catch((error) => {
        console.log(error);
      })
  }

  useEffect(() => {
    getData()
  }, [])


  return (
    <div className="App">
      <header className="App-header">
        <button onClick={() => { console.log(users) }}>Get users</button>
        <ul>
          {users?.map((user) => {
            return (
              <li key={user.id}>Name: {user.name}</li>
            )
          })}
        </ul>
      </header>
    </div>
  );
}

export default App;
