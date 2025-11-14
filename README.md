# TypeFunctions

# Overview

| **Name**               | **Description**                                                                                                                                                         |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Partial< T >**       | Makes all properties of a table type optional. For unions/intersections, removes `nil` branches and wraps the rest in `optional`. Recursively applies to nested tables. |
| **Dissolve< T >**      | Removes `nil` from unions, returning the “non-optional” version of a type. For tables, unwraps nested optional properties.                                              |
| **Required< T >**      | Removes optionality from a type. For tables, strips `nil` and returns only required properties. For unions, collapses non-nil variants.                                 |
| **Record< K, V >**     | Creates a table type where keys of type `K` map to values of type `V`. Equivalent to a dictionary type.                                                                 |
| **Readonly< T >**      | Makes all table properties read-only. All write properties become `never`. Does not modify non-table types.                                                             |
| **NonNullable< T >**   | Removes `nil` from a union type. Equivalent to `Exclude<T, nil>`.                                                                                                       |
| **Exclude< T, U >**    | Removes `U` from the union type `T`. If `T` is a table type, removes any matching properties instead.                                                                   |
| **Extract< T, U >**    | Opposite of `Exclude`: keeps only the parts of `T` assignable to `U`. For table types, selects only matching properties.                                                |
| **IsOptional< T >**    | Returns a boolean singleton (`true` or `false`) depending on whether a union contains `nil`.                                                                            |
| **DeepReadonly< T >**  | Recursively applies `Readonly` to a table type and all nested table types. Unions are transformed element-by-element.                                                   |
| **ToCamelCase< S >**   | Converts a string singleton type (e.g., `"my value"`) into a `camelCase` string singleton.                                                                              |
| **ToKebabCase< S >**   | Converts a string singleton type into `kebab-case`. `"MyValue"` → `"my-value"`.                                                                                         |
| **Pick< T, Keys... >** | Creates a new table type containing only the selected properties. Similar to TypeScript’s `Pick<T, K>`.                                                                 |
| **Merge< A, B >**      | Merges two table types. Properties from `B` override `A`. Indexers from `B` also override.                                                                              |
| **ValuesOf< T >**      | Given a table type, returns the union of all property value types.                                                                                                      |



TypeFunctions are meant to serve as a utility library for Types. Unlike normal types, these ones arent as specific, as type functions expect a type, and return a type.

I've combined a few of my most useful type functions, and make an example file of what usage should look like. To use these type functions theres one prerequesite

# Studio Users

For roblox studio programmers, navigate to File at the top 
<img width="244" height="615" alt="image" src="https://github.com/user-attachments/assets/e8c4444d-c151-471a-b4ce-715cfa677d91" />

click Beta Features and make sure this is enabled
<img width="780" height="90" alt="image" src="https://github.com/user-attachments/assets/9908f386-bc3e-495a-ac27-47bbb7134f4a" />

Tldr: File > Beta Settings > Enable new luau solver

# VSC / Rojo Users

Naviggate to luau LSP in extensions
<img width="286" height="149" alt="image" src="https://github.com/user-attachments/assets/64e8059b-bddb-4208-b308-2e190f43a86b" />

Click the gear and go to settings 
<img width="288" height="585" alt="image" src="https://github.com/user-attachments/assets/466efbb9-94e3-4ef0-bf3b-f041248601c6" />

Make sure new solver is enabled 
<img width="781" height="102" alt="image" src="https://github.com/user-attachments/assets/44023540-577f-4e15-874e-dabb8d5ac5a5" />
