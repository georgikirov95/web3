// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

contract TodoApp {
    struct Todo {
        string title;
        bool completed;
    }
    Todo[] public todos;

    function create(string calldata title) external {
        Todo memory todo = Todo(title, false);
        todos.push(todo);
    }

    function get(uint index) external view returns (string memory, bool) {
        Todo storage todo = todos[index];
        return (todo.title, todo.completed);
    }

    function updateTitle(uint index, string calldata newTitle) external {
        Todo storage todo = todos[index];
        todo.title = newTitle;
    }

    function complete(uint index) external {
        Todo storage todo = todos[index];
        todo.completed = true;
    }

    function deleteAtIndex(uint index) external {
        // Deletes the todo at the specified index but does not reallocate the array.
        // The slot at the specified index will be set to the default values of the Todo struct
        // "" for the string and false for the boolean).
        delete todos[index];
    }
}
