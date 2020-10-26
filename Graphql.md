<!-- ✔️
This document is ´written´ by a proud Script Kiddy

The document itself is under MIT License
Copyright © 2020 Benjamin Vincent (Luxcium)

The documentation text contained in this document is
the work of Kamil Myśliwiec Copyright © 2017-2020 under MIT License

(The MIT License)

Copyright © 2017-2020 Kamil Myśliwiec <https://kamilmysliwiec.com> ― Docs Author
Copyright © 2020 Benjamin Vincent (Luxcium) ― Colligated Documentation Editror

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
## Graphql
 - <a href="#quick-start">Quick start</a>
 - <a href="#resolvers">Resolvers</a>
 - <a href="#mutations">Mutations</a>
 - <a href="#subscriptions">Subscriptions</a>
 - <a href="#scalars">Scalars</a>
 - <a href="#directives">Directives</a>
 - <a href="#plugins">Plugins</a>
 - <a href="#interfaces">Interfaces</a>
 - <a href="#unions">Unions</a>
 - <a href="#enums">Enums</a>
 - <a href="#mapped-types">Mapped types</a>
 - <a href="#complexity">Complexity</a>
 - <a href="#extensions">Extensions</a>
 - <a href="#cli-plugin">CLI Plugin</a>
 - <a href="#generating-sdl">Generating SDL</a>
 - <a href="#other-features">Other features</a>
 - <a href="#federation">Federation</a>


> Click the logo to get redirected to the official docs <a href="https://docs.nestjs.com/"><img src="https://nestjs.com/img/logo-small.svg" width="25" alt="Nest Logo" /></a>


------

### Harnessing the power of TypeScript & GraphQL <a href="https://docs.nestjs.com/graphql/quick-start"><img src="https://nestjs.com/img/logo-small.svg" id="quick-start" width="20" alt="Nest Logo" /></a>

[GraphQL](https://graphql.org/) is a powerful query language for APIs and a runtime for fulfilling those queries with your existing data. It's an elegant approach that solves many problems typically found with REST APIs. For background, we suggest reading this [comparison](https://dev-blog.apollodata.com/graphql-vs-rest-5d425123e34b) between GraphQL and REST. GraphQL combined with [TypeScript](https://www.typescriptlang.org/) helps you develop better type safety with your GraphQL queries, giving you end-to-end typing.

In this chapter, we assume a basic understanding of GraphQL, and focus on how to work with the built-in `@nestjs/graphql` module. The `GraphQLModule` is a wrapper around the [Apollo](https://www.apollographql.com/) server. We use this proven GraphQL package to provide a way to use GraphQL with Nest.

#### Installation

Start by installing the required packages:

```bash
$ npm i @nestjs/graphql graphql-tools graphql apollo-server-express
```
> info **Hint** If using Fastify, instead of installing `apollo-server-express`, you should install `apollo-server-fastify`.

#### Overview

Nest offers two ways of building GraphQL applications, the **code first** and the **schema first** methods. You should choose the one that works best for you. Most of the chapters in this GraphQL section are divided into two main parts: one you should follow if you adopt **code first**, and the other to be used if you adopt **schema first**.

In the **code first** approach, you use decorators and TypeScript classes to generate the corresponding GraphQL schema. This approach is useful if you prefer to work exclusively with TypeScript and avoid context switching between language syntaxes.

In the **schema first** approach, the source of truth is GraphQL SDL (Schema Definition Language) files. SDL is a language-agnostic way to share schema files between different platforms. Nest automatically generates your TypeScript definitions (using either classes or interfaces) based on the GraphQL schemas to reduce the need to write redundant boilerplate code.

#### Getting started with GraphQL & TypeScript

Once the packages are installed, we can import the `GraphQLModule` and configure it with the `forRoot()` static method.

```typescript
@@filename()
import { Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';

@Module({
  imports: [
    GraphQLModule.forRoot({}),
  ],
})
export class AppModule {}
```

The `forRoot()` method takes an options object as an argument. These options are passed through to the underlying Apollo instance (read more about available settings [here](https://www.apollographql.com/docs/apollo-server/v2/api/apollo-server.html#constructor-options-lt-ApolloServer-gt)). For example, if you want to disable the `playground` and turn off `debug` mode, pass the following options:

```typescript
@@filename()
import { Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';

@Module({
  imports: [
    GraphQLModule.forRoot({
      debug: false,
      playground: false,
    }),
  ],
})
export class AppModule {}
```

As mentioned, these options will be forwarded to the `ApolloServer` constructor.

<app-banner-enterprise></app-banner-enterprise>

#### GraphQL playground

The playground is a graphical, interactive, in-browser GraphQL IDE, available by default on the same URL as the GraphQL server itself. To access the playground, you need a basic GraphQL server configured and running. To see it now, you can install and build the [working example here](https://github.com/nestjs/nest/tree/master/sample/23-graphql-code-first). Alternatively, if you're following along with these code samples, once you've complete the steps in the [Resolvers chapter](/graphql/resolvers-map), you can access the playground.

With that in place, and with your application running in the background, you can then open your web browser and navigate to `http://localhost:3000/graphql` (host and port may vary depending on your configuration). You will then see the GraphQL playground, as shown below.

<figure>
  <img src="https://github.com/Luxcium/docs.nestjs.com/blob/master/src/assets/playground.png" alt="" />
</figure>

#### Multiple endpoints

Another useful feature of the `@nestjs/graphql` module is the ability to serve multiple endpoints at once. This lets you decide which modules should be included in which endpoint. By default, `GraphQL` searches for resolvers throughout the whole app. To limit this scan to only a subset of modules, use the `include` property.

```typescript
GraphQLModule.forRoot({
  include: [CatsModule],
}),
```

#### Code first

In the **code first** approach, you use decorators and TypeScript classes to generate the corresponding GraphQL schema.

To use the code first approach, start by adding the `autoSchemaFile` property to the options object:

```typescript
GraphQLModule.forRoot({
  autoSchemaFile: join(process.cwd(), 'src/schema.gql'),
}),
```

The `autoSchemaFile` property value is the path where your automatically generated schema will be created. Alternatively, the schema can be generated on-the-fly in memory. To enable this, set the `autoSchemaFile` property to `true`:

```typescript
GraphQLModule.forRoot({
  autoSchemaFile: true,
}),
```

By default, the types in the generated schema will be in the order they are defined in the included modules. To sort the schema lexicographically, set the `sortSchema` property to `true`:

```typescript
GraphQLModule.forRoot({
  autoSchemaFile: join(process.cwd(), 'src/schema.gql'),
  sortSchema: true,
}),
```

A fully working code first sample is available [here](https://github.com/nestjs/nest/tree/master/sample/23-graphql-code-first).

#### Schema first

To use the schema first approach, start by adding a `typePaths` property to the options object. The `typePaths` property indicates where the `GraphQLModule` should look for GraphQL SDL schema definition files you'll be writing. These files will be combined in memory; this allows you to split your schemas into several files and locate them near their resolvers.

```typescript
GraphQLModule.forRoot({
  typePaths: ['./**/*.graphql'],
}),
```

You will typically also need to have TypeScript definitions (classes and interfaces) that correspond to the GraphQL SDL types. Creating the corresponding TypeScript definitions by hand is redundant and tedious. It leaves us without a single source of truth -- each change made within SDL forces us to adjust TypeScript definitions as well. To address this, the `@nestjs/graphql` package can **automatically generate** TypeScript definitions from the abstract syntax tree ([AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree)). To enable this feature, add the `definitions` options property when configuring the `GraphQLModule`.

```typescript
GraphQLModule.forRoot({
  typePaths: ['./**/*.graphql'],
  definitions: {
    path: join(process.cwd(), 'src/graphql.ts'),
  },
}),
```

The path property of the `definitions` object indicates where to save generated TypeScript output. By default, all generated TypeScript types are created as interfaces. To generate classes instead, specify the `outputAs` property with a value of `'class'`.

```typescript
GraphQLModule.forRoot({
  typePaths: ['./**/*.graphql'],
  definitions: {
    path: join(process.cwd(), 'src/graphql.ts'),
    outputAs: 'class',
  },
}),
```

The above approach dynamically generates TypeScript definitions each time the application starts. Alternatively, it may be preferable to build a simple script to generate these on demand. For example, assume we create the following script as `generate-typings.ts`:

```typescript
import { GraphQLDefinitionsFactory } from '@nestjs/graphql';
import { join } from 'path';

const definitionsFactory = new GraphQLDefinitionsFactory();
definitionsFactory.generate({
  typePaths: ['./src/**/*.graphql'],
  path: join(process.cwd(), 'src/graphql.ts'),
  outputAs: 'class',
});
```

Now you can run this script on demand:

```bash
$ ts-node generate-typings
```

> info **Hint** You can compile the script beforehand (e.g., with `tsc`) and use `node` to execute it.

To enable watch mode for the script (to automatically generate typings whenever any `.graphql` file changes), pass the `watch` option to the `generate()` method.

```typescript
definitionsFactory.generate({
  typePaths: ['./src/**/*.graphql'],
  path: join(process.cwd(), 'src/graphql.ts'),
  outputAs: 'class',
  watch: true,
});
```

To automatically generate the additional `__typename` field for every object type, enable the `emitTypenameField` option.

```typescript
definitionsFactory.generate({
  // ...,
  emitTypenameField: true,
});
```

To generate resolvers (queries, mutations, subscriptions) as plain fields without arguments, enable the `skipResolverArgs` option.

```typescript
definitionsFactory.generate({
  // ...,
  skipResolverArgs: true,
});
```

A fully working schema first sample is available [here](https://github.com/nestjs/nest/tree/master/sample/12-graphql-schema-first).

#### Accessing generated schema

In some circumstances (for example end-to-end tests), you may want to get a reference to the generated schema object. In end-to-end tests, you can then run queries using the `graphql` object without using any HTTP listeners.

You can access the generated schema (in either the code first or schema first approach), using the `GraphQLSchemaHost` class:

```typescript
const { schema } = app.get(GraphQLSchemaHost);
```

> info **Hint** You must call the `GraphQLSchemaHost#schema` getter after the application has been initialized (after the `onModuleInit` hook has been triggered by either the `app.listen()` or `app.init()` method).

#### Async configuration

When you need to pass module options asynchronously instead of statically, use the `forRootAsync()` method. As with most dynamic modules, Nest provides several techniques to deal with async configuration.

One technique is to use a factory function:

```typescript
GraphQLModule.forRootAsync({
  useFactory: () => ({
    typePaths: ['./**/*.graphql'],
  }),
}),
```

Like other factory providers, our factory function can be <a href="https://docs.nestjs.com/fundamentals/custom-providers#factory-providers-usefactory">async</a> and can inject dependencies through `inject`.

```typescript
GraphQLModule.forRootAsync({
  imports: [ConfigModule],
  useFactory: async (configService: ConfigService) => ({
    typePaths: configService.getString('GRAPHQL_TYPE_PATHS'),
  }),
  inject: [ConfigService],
}),
```

Alternatively, you can configure the `GraphQLModule` using a class instead of a factory, as shown below:

```typescript
GraphQLModule.forRootAsync({
  useClass: GqlConfigService,
}),
```

The construction above instantiates `GqlConfigService` inside `GraphQLModule`, using it to create options object. Note that in this example, the `GqlConfigService` has to implement the `GqlOptionsFactory` interface, as shown below. The `GraphQLModule` will call the `createGqlOptions()` method on the instantiated object of the supplied class.

```typescript
@Injectable()
class GqlConfigService implements GqlOptionsFactory {
  createGqlOptions(): GqlModuleOptions {
    return {
      typePaths: ['./**/*.graphql'],
    };
  }
}
```

If you want to reuse an existing options provider instead of creating a private copy inside the `GraphQLModule`, use the `useExisting` syntax.

```typescript
GraphQLModule.forRootAsync({
  imports: [ConfigModule],
  useExisting: ConfigService,
}),
```
### Resolvers <a href="https://docs.nestjs.com/graphql/resolvers"><img src="https://nestjs.com/img/logo-small.svg" id="resolvers" width="20" alt="Nest Logo" /></a>

Resolvers provide the instructions for turning a [GraphQL](https://graphql.org/) operation (a query, mutation, or subscription) into data. They return the same shape of data we specify in our schema -- either synchronously or as a promise that resolves to a result of that shape. Typically, you create a **resolver map** manually. The `@nestjs/graphql` package, on the other hand, generates a resolver map automatically using the metadata provided by decorators you use to annotate classes. To demonstrate the process of using the package features to create a GraphQL API, we'll create a simple authors API.

#### Code first

In the code first approach, we don't follow the typical process of creating our GraphQL schema by writing GraphQL SDL by hand. Instead, we use TypeScript decorators to generate the SDL from TypeScript class definitions. The `@nestjs/graphql` package reads the metadata defined through the decorators and automatically generates the schema for you.

#### Object types

Most of the definitions in a GraphQL schema are **object types**. Each object type you define should represent a domain object that an application client might need to interact with. For example, our sample API needs to be able to fetch a list of authors and their posts, so we should define the `Author` type and `Post` type to support this functionality.

If we were using the schema first approach, we'd define such a schema with SDL like this:

```graphql
type Author {
  id: Int!
  firstName: String
  lastName: String
  posts: [Post]
}
```

In this case, using the code first approach, we define schemas using TypeScript classes and using TypeScript decorators to annotate the fields of those classes. The equivalent of the above SDL in the code first approach is:

```typescript
@@filename(authors/models/author.model)
import { Field, Int, ObjectType } from '@nestjs/graphql';
import { Post } from './post';

@ObjectType()
export class Author {
  @Field(type => Int)
  id: number;

  @Field({ nullable: true })
  firstName?: string;

  @Field({ nullable: true })
  lastName?: string;

  @Field(type => [Post])
  posts: Post[];
}
```

> info **Hint** TypeScript's metadata reflection system has several limitations which make it impossible, for instance, to determine what properties a class consists of or recognize whether a given property is optional or required. Because of these limitations, we must either explicitly use the `@Field()` decorator in our schema definition classes to provide metadata about each field's GraphQL type and optionality, or use a [CLI plugin](/graphql/cli-plugin) to generate these for us.

The `Author` object type, like any class, is made of a collection of fields, with each field declaring a type. A field's type corresponds to a [GraphQL type](https://graphql.org/learn/schema/). A field's GraphQL type can be either another object type or a scalar type. A GraphQL scalar type is a primitive (like `ID`, `String`, `Boolean`, or `Int`) that resolves to a single value.

> info **Hint** In addition to GraphQL's built-in scalar types, you can define custom scalar types (read [more](/graphql/scalars)).

The above `Author` object type definition will cause Nest to **generate** the SDL we showed above:

```graphql
type Author {
  id: Int!
  firstName: String
  lastName: String
  posts: [Post]
}
```

The `@Field()` decorator accepts an optional type function (e.g., `type => Int`), and optionally an options object.

The type function is required when there's the potential for ambiguity between the TypeScript type system and the GraphQL type system. Specifically: it is **not** required for `string` and `boolean` types; it **is** required for arrays, numbers (which must be mapped to either a GraphQL `Int` or `Float`) and object types. The type function should simply return the desired GraphQL type (as shown in various examples in these chapters).

The options object can have any of the following key/value pairs:

- `nullable`: for specifying whether a field is nullable (in SDL, each field is non-nullable by default); `boolean`
- `description`: for setting a field description; `string`
- `deprecationReason`: for marking a field as deprecated; `string`

For example:

```typescript
@Field({ description: `Book title`, deprecationReason: 'Not useful in v2 schema' })
title: string;
```

> info **Hint** You can also add a description to, or deprecate, the whole object type: `@ObjectType({{ '{' }} description: 'Author model' {{ '}' }})`.

When the field is an array, we must manually indicate the array type in the `Field()` decorator's type function, as shown below:

```typescript
@Field(type => [Post])
posts: Post[];
```

> info **Hint** Using array bracket notation (`[ ]`), we can indicate the depth of the array. For example, using `[[Int]]` would represent an integer matrix.

To declare that an array's items (not the array itself) are nullable, set the `nullable` property to `'items'` as shown below:

```typescript
@Field(type => [Post], { nullable: 'items' })
posts: Post[];
```

> info **Hint** If both the array and its items are nullable, set `nullable` to `'itemsAndList'` instead.

Now that the `Author` object type is created, let's define the `Post` object type.

```typescript
@@filename(posts/models/post.model)
import { Field, Int, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class Post {
  @Field(type => Int)
  id: number;

  @Field()
  title: string;

  @Field(type => Int, { nullable: true })
  votes?: number;
}
```

The `Post` object type will result in generating the following part of the GraphQL schema in SDL:

```graphql
@@filename(schema.gql)
type Post {
  id: Int!
  title: String!
  votes: Int
}
```

#### Code first resolver

At this point, we've defined the objects (type definitions) that can exist in our data graph, but clients don't yet have a way to interact with those objects. To address that, we need to create a resolver class. In the code first method, a resolver class both defines resolver functions **and** generates the **Query type**. This will be clear as we work through the example below:

```typescript
@@filename(authors/authors.resolver)
@Resolver(of => Author)
export class AuthorsResolver {
  constructor(
    private authorsService: AuthorsService,
    private postsService: PostsService,
  ) {}

  @Query(returns => Author)
  async author(@Args('id', { type: () => Int }) id: number) {
    return this.authorsService.findOneById(id);
  }

  @ResolveField()
  async posts(@Parent() author: Author) {
    const { id } = author;
    return this.postsService.findAll({ authorId: id });
  }
}
```

> info **Hint** All decorators (e.g., `@Resolver`, `@ResolveField`, `@Args`, etc.) are exported from the `@nestjs/graphql` package.

You can define multiple resolver classes. Nest will combine these at run time. See the [module](/graphql/resolvers#module) section below for more on code organization.

> warning **Note** The logic inside the `AuthorsService` and `PostsService` classes can be as simple or sophisticated as needed. The main point of this example is to show how to construct resolvers and how they can interact with other providers.

In the example above, we created the `AuthorsResolver` which defines one query resolver function and one field resolver function. To create a resolver, we create a class with resolver functions as methods, and annotate the class with the `@Resolver()` decorator.

In this example, we defined a query handler to get the author object based on the `id` sent in the request. To specify that the method is a query handler, use the `@Query()` decorator.

The argument passed to the `@Resolver()` decorator is optional, but comes into play when our graph becomes non-trivial. It's used to supply a parent object used by field resolver functions as they traverse down through an object graph.

In our example, since the class includes a **field resolver** function (for the `posts` property of the `Author` object type), we **must** supply the `@Resolver()` decorator with a value to indicate which class is the parent type (i.e., the corresponding `ObjectType` class name) for all field resolvers defined within this class. As should be clear from the example, when writing a field resolver function, it's necessary to access the parent object (the object the field being resolved is a member of). In this example, we populate an author's posts array with a field resolver that calls a service which takes the author's `id` as an argument. Hence the need to identify the parent object in the `@Resolver()` decorator. Note the corresponding use of the `@Parent()` method parameter decorator to then extract a reference to that parent object in the field resolver.

We can define multiple `@Query()` resolver functions (both within this class, and in any other resolver class), and they will be aggregated into a single **Query type** definition in the generated SDL along with the appropriate entries in the resolver map. This allows you to define queries close to the models and services that they use, and to keep them well organized in modules.

#### Query type names

In the above examples, the `@Query()` decorator generates a GraphQL schema query type name based on the method name. For example, consider the following construction from the example above:

```typescript
@Query(returns => Author)
async author(@Args('id', { type: () => Int }) id: number) {
  return this.authorsService.findOneById(id);
}
```

This generates the following entry for the author query in our schema (the query type uses the same name as the method name):

```graphql
type Query {
  author(id: Int!): Author
}
```

> info **Hint** Learn more about GraphQL queries [here](https://graphql.org/learn/queries/).

Conventionally, we prefer to decouple these names; for example, we prefer to use a name like `getAuthor()` for our query handler method, but still use `author` for our query type name. The same applies to our field resolvers. We can easily do this by passing the mapping names as arguments of the `@Query()` and `@ResolveField()` decorators, as shown below:

```typescript
@@filename(authors/authors.resolver)
@Resolver(of => Author)
export class AuthorsResolver {
  constructor(
    private authorsService: AuthorsService,
    private postsService: PostsService,
  ) {}

  @Query(returns => Author, { name: 'author' })
  async getAuthor(@Args('id', { type: () => Int }) id: number) {
    return this.authorsService.findOneById(id);
  }

  @ResolveField('posts', returns => [Post])
  async getPosts(@Parent() author: Author) {
    const { id } = author;
    return this.postsService.findAll({ authorId: id });
  }
}
```

The `getAuthor` handler method above will result in generating the following part of the GraphQL schema in SDL:

```graphql
type Query {
  author(id: Int!): Author
}
```

#### Query decorator options

The `@Query()` decorator's options object (where we pass `{{ '{' }}name: 'author'{{ '}' }}` above) accepts a number of key/value pairs:

- `name`: name of the query; a `string`
- `description`: a description that will be used to generate GraphQL schema documentation (e.g., in GraphQL playground); a `string`
- `deprecationReason`: sets query metadata to show the query as deprecated (e.g., in GraphQL playground); a `string`
- `nullable`: whether the query can return a null data response; `boolean` or `'items'` or `'itemsAndList'` (see above for details of `'items'` and `'itemsAndList'`)

#### Args decorator options

Use the `@Args()` decorator to extract arguments from a request for use in the method handler. This works in a very similar fashion to [REST route parameter argument extraction](/controllers#route-parameters).

Usually your `@Args()` decorator will be simple, and not require an object argument as seen with the `getAuthor()` method above. For example, if the type of an identifier is string, the following construction is sufficient, and simply plucks the named field from the inbound GraphQL request for use as a method argument.

```typescript
@Args('id') id: string
```

In the `getAuthor()` case, the `number` type is used, which presents a challenge. The `number` TypeScript type doesn't give us enough information about the expected GraphQL representation (e.g., `Int` vs. `Float`). Thus we have to **explicitly** pass the type reference. We do that by passing a second argument to the `Args()` decorator, containing argument options, as shown below:

```typescript
@Query(returns => Author, { name: 'author' })
async getAuthor(@Args('id', { type: () => Int }) id: number) {
  return this.authorsService.findOneById(id);
}
```

The options object allows us to specify the following optional key value pairs:

- `type`: a function returning the GraphQL type
- `defaultValue`: a default value; `any`
- `description`: description metadata; `string`
- `deprecationReason`: to deprecate a field and provide meta data describing why; `string`
- `nullable`: whether the field is nullable

Query handler methods can take multiple arguments. Let's imagine that we want to fetch an author based on its `firstName` and `lastName`. In this case, we can call `@Args` twice:

```typescript
getAuthor(
  @Args('firstName', { nullable: true }) firstName?: string,
  @Args('lastName', { defaultValue: '' }) lastName?: string,
) {}
```

#### Dedicated arguments class

With inline `@Args()` calls, code like the example above becomes bloated. Instead, you can create a dedicated `GetAuthorArgs` arguments class and access it in the handler method as follows:

```typescript
@Args() args: GetAuthorArgs
```

Create the `GetAuthorArgs` class using `@ArgsType()` as shown below:

```typescript
@@filename(authors/dto/get-author.args)
import { MinLength } from 'class-validator';
import { Field, ArgsType } from '@nestjs/graphql';

@ArgsType()
class GetAuthorArgs {
  @Field({ nullable: true })
  firstName?: string;

  @Field({ defaultValue: '' })
  @MinLength(3)
  lastName: string;
}
```

> info **Hint** Again, due to TypeScript's metadata reflection system limitations, it's required to either use the `@Field` decorator to manually indicate type and optionality, or use a [CLI plugin](/graphql/cli-plugin).

This will result in generating the following part of the GraphQL schema in SDL:

```graphql
type Query {
  author(firstName: String, lastName: String = ''): Author
}
```

> info **Hint** Note that arguments classes like `GetAuthorArgs` play very well with the `ValidationPipe` (read [more](/techniques/validation)).

#### Class inheritance

You can use standard TypeScript class inheritance to create base classes with generic utility type features (fields and field properties, validations, etc.) that can be extended. For example, you may have a set of pagination related arguments that always include the standard `offset` and `limit` fields, but also other index fields that are type-specific. You can set up a class hierarchy as shown below.

Base `@ArgsType()` class:

```typescript
@ArgsType()
class PaginationArgs {
  @Field((type) => Int)
  offset: number = 0;

  @Field((type) => Int)
  limit: number = 10;
}
```

Type specific sub-class of the base `@ArgsType()` class:

```typescript
@ArgsType()
class GetAuthorArgs extends PaginationArgs {
  @Field({ nullable: true })
  firstName?: string;

  @Field({ defaultValue: '' })
  @MinLength(3)
  lastName: string;
}
```

The same approach can be taken with `@ObjectType()` objects. Define generic properties on the base class:

```typescript
@ObjectType()
class Character {
  @Field((type) => Int)
  id: number;

  @Field()
  name: string;
}
```

Add type-specific properties on sub-classes:

```typescript
@ObjectType()
class Warrior extends Character {
  @Field()
  level: number;
}
```

You can use inheritance with a resolver as well. You can ensure type safety by combining inheritance and TypeScript generics. For example, to create a base class with a generic `findAll` query, use a construction like this:

```typescript
function BaseResolver<T extends Type<unknown>>(classRef: T): any {
  @Resolver({ isAbstract: true })
  abstract class BaseResolverHost {
    @Query((type) => [classRef], { name: `findAll${classRef.name}` })
    async findAll(): Promise<T[]> {
      return [];
    }
  }
  return BaseResolverHost;
}
```

Note the following:

- an explicit return type (`any` above) is required: otherwise TypeScript complains about the usage of a private class definition. Recommended: define an interface instead of using `any`.
- `Type` is imported from the `@nestjs/common` package
- The `isAbstract: true` property indicates that SDL (Schema Definition Language statements) shouldn't be generated for this class. Note, you can set this property for other types as well to suppress SDL generation.

Here's how you could generate a concrete sub-class of the `BaseResolver`:

```typescript
@Resolver((of) => Recipe)
export class RecipesResolver extends BaseResolver(Recipe) {
  constructor(private recipesService: RecipesService) {
    super();
  }
}
```

This construct would generated the following SDL:

```graphql
type Query {
  findAllRecipe: [Recipe!]!
}
```

#### Generics

We saw one use of generics above. This powerful TypeScript feature can be used to create useful abstractions. For example, here's a sample cursor-based pagination implementation based on [this documentation](https://graphql.org/learn/pagination/#pagination-and-edges):

```typescript
import { Field, ObjectType, Int } from '@nestjs/graphql';
import { Type } from '@nestjs/common';

export function Paginated<T>(classRef: Type<T>): any {
  @ObjectType(`${classRef.name}Edge`)
  abstract class EdgeType {
    @Field((type) => String)
    cursor: string;

    @Field((type) => classRef)
    node: T;
  }

  @ObjectType({ isAbstract: true })
  abstract class PaginatedType {
    @Field((type) => [EdgeType], { nullable: true })
    edges: EdgeType[];

    @Field((type) => [classRef], { nullable: true })
    nodes: T[];

    @Field((type) => Int)
    totalCount: number;

    @Field()
    hasNextPage: boolean;
  }
  return PaginatedType;
}
```

With the above base class defined, we can now easily create specialized types that inherit this behavior. For example:

```typescript
@ObjectType()
class PaginatedAuthor extends Paginated(Author) {}
```

#### Schema first

As mentioned in the [previous](/graphql/quick-start) chapter, in the schema first approach we start by manually defining schema types in SDL (read [more](https://graphql.org/learn/schema/#type-language)). Consider the following SDL type definitions.

> info **Hint** For convenience in this chapter, we've aggregated all of the SDL in one location (e.g., one `.graphql` file, as shown below). In practice, you may find it appropriate to organize your code in a modular fashion. For example, it can be helpful to create individual SDL files with type definitions representing each domain entity, along with related services, resolver code, and the Nest module definition class, in a dedicated directory for that entity. Nest will aggregate all the individual schema type definitions at run time.

```graphql
type Author {
  id: Int!
  firstName: String
  lastName: String
  posts: [Post]
}

type Post {
  id: Int!
  title: String!
  votes: Int
}

type Query {
  author(id: Int!): Author
}
```

#### Schema first resolver

The schema above exposes a single query - `author(id: Int!): Author`.

> info **Hint** Learn more about GraphQL queries [here](https://graphql.org/learn/queries/).

Let's now create an `AuthorsResolver` class that resolves author queries:

```typescript
@@filename(authors/authors.resolver)
@Resolver('Author')
export class AuthorsResolver {
  constructor(
    private authorsService: AuthorsService,
    private postsService: PostsService,
  ) {}

  @Query()
  async author(@Args('id') id: number) {
    return this.authorsService.findOneById(id);
  }

  @ResolveField()
  async posts(@Parent() author) {
    const { id } = author;
    return this.postsService.findAll({ authorId: id });
  }
}
```

> info **Hint** All decorators (e.g., `@Resolver`, `@ResolveField`, `@Args`, etc.) are exported from the `@nestjs/graphql` package.

> warning **Note** The logic inside the `AuthorsService` and `PostsService` classes can be as simple or sophisticated as needed. The main point of this example is to show how to construct resolvers and how they can interact with other providers.

The `@Resolver()` decorator is required. It takes an optional string argument with the name of a class. This class name is required whenever the class includes `@ResolveField()` decorators to inform Nest that the decorated method is associated with a parent type (the `Author` type in our current example). Alternatively, instead of setting `@Resolver()` at the top of the class, this can be done for each method:

```typescript
@Resolver('Author')
@ResolveField()
async posts(@Parent() author) {
  const { id } = author;
  return this.postsService.findAll({ authorId: id });
}
```

In this case (`@Resolver()` decorator at the method level), if you have multiple `@ResolveField()` decorators inside a class, you must add `@Resolver()` to all of them. This is not considered the best practice (as it creates extra overhead).

> info **Hint** Any class name argument passed to `@Resolver()` **does not** affect queries (`@Query()` decorator) or mutations (`@Mutation()` decorator).

> warning **Warning** Using the `@Resolver` decorator at the method level is not supported with the **code first** approach.

In the above examples, the `@Query()` and `@ResolveField()` decorators are associated with GraphQL schema types based on the method name. For example, consider the following construction from the example above:

```typescript
@Query()
async author(@Args('id') id: number) {
  return this.authorsService.findOneById(id);
}
```

This generates the following entry for the author query in our schema (the query type uses the same name as the method name):

```graphql
type Query {
  author(id: Int!): Author
}
```

Conventionally, we would prefer to decouple these, using names like `getAuthor()` or `getPosts()` for our resolver methods. We can easily do this by passing the mapping name as an argument to the decorator, as shown below:

```typescript
@@filename(authors/authors.resolver)
@Resolver('Author')
export class AuthorsResolver {
  constructor(
    private authorsService: AuthorsService,
    private postsService: PostsService,
  ) {}

  @Query('author')
  async getAuthor(@Args('id') id: number) {
    return this.authorsService.findOneById(id);
  }

  @ResolveField('posts')
  async getPosts(@Parent() author) {
    const { id } = author;
    return this.postsService.findAll({ authorId: id });
  }
}
```

#### Generating types

Assuming that we use the schema first approach and have enabled the typings generation feature (with `outputAs: 'class'` as shown in the [previous](/graphql/quick-start) chapter), once you run the application it will generate the following file (in the location you specified in the `GraphQLModule.forRoot()` method. For example, in `src/graphql.ts`)

```typescript
@@filename(graphql)
export class Author {
  id: number;
  firstName?: string;
  lastName?: string;
  posts?: Post[];
}

export class Post {
  id: number;
  title: string;
  votes?: number;
}

export abstract class IQuery {
  abstract author(id: number): Author | Promise<Author>;
}
```

By generating classes (instead of the default technique of generating interfaces), you can use declarative validation **decorators** in combination with the schema first approach, which is an extremely useful technique (read [more](/techniques/validation)). For example, you could add `class-validator` decorators to the generated `CreatePostInput` class as shown below to enforce minimum and maximum string lengths on the `title` field:

```typescript
import { MinLength, MaxLength } from 'class-validator';

export class CreatePostInput {
  @MinLength(3)
  @MaxLength(50)
  title: string;
}
```

> warning **Notice** To enable auto-validation of your inputs (and parameters), use `ValidationPipe`. Read more about validation [here](/techniques/validation) and more specifically about pipes [here](/pipes).

However, if you add decorators directly to the automatically generated file, they will be **overwritten** each time the file is generated. Instead, create a separate file and simply extend the generated class.

```typescript
import { MinLength, MaxLength } from 'class-validator';
import { Post } from '../../graphql.ts';

export class CreatePostInput extends Post {
  @MinLength(3)
  @MaxLength(50)
  title: string;
}
```

#### GraphQL argument decorators

We can access the standard GraphQL resolver arguments using dedicated decorators. Below is a comparison of the Nest decorators and the plain Apollo parameters they represent.

<table>
  <tbody>
    <tr>
      <td><code>@Root()</code> and <code>@Parent()</code></td>
      <td><code>root</code>/<code>parent</code></td>
    </tr>
    <tr>
      <td><code>@Context(param?: string)</code></td>
      <td><code>context</code> / <code>context[param]</code></td>
    </tr>
    <tr>
      <td><code>@Info(param?: string)</code></td>
      <td><code>info</code> / <code>info[param]</code></td>
    </tr>
    <tr>
      <td><code>@Args(param?: string)</code></td>
      <td><code>args</code> / <code>args[param]</code></td>
    </tr>
  </tbody>
</table>

These arguments have the following meanings:

- `root`: an object that contains the result returned from the resolver on the parent field, or, in the case of a top-level `Query` field, the `rootValue` passed from the server configuration.
- `context`: an object shared by all resolvers in a particular query; typically used to contain per-request state.
- `info`: an object that contains information about the execution state of the query.
- `args`: an object with the arguments passed into the field in the query.

<app-banner-shop></app-banner-shop>

#### Module

Once we're done with the above steps, we have declaratively specified all the information needed by the `GraphQLModule` to generate a resolver map. The `GraphQLModule` uses reflection to introspect the meta data provided via the decorators, and transforms classes into the correct resolver map automatically.

The only other thing you need to take care of is to **provide** (i.e., list as a `provider` in some module) the resolver class(es) (`AuthorsResolver`), and importing the module (`AuthorsModule`) somewhere, so Nest will be able to utilize it.

For example, we can do this in an `AuthorsModule`, which can also provide other services needed in this context. Be sure to import `AuthorsModule` somewhere (e.g., in the root module, or some other module imported by the root module).

```typescript
@@filename(authors/authors.module)
@Module({
  imports: [PostsModule],
  providers: [AuthorsService, AuthorsResolver],
})
export class AuthorsModule {}
```

> info **Hint** It is helpful to organize your code by your so-called **domain model** (similar to the way you would organize entry points in a REST API). In this approach, keep your models (`ObjectType` classes), resolvers and services together within a Nest module representing the domain model. Keep all of these components in a single folder per module. When you do this, and use the [Nest CLI](/cli/overview) to generate each element, Nest will wire all of these parts together (locating files in appropriate folders, generating entries in `provider` and `imports` arrays, etc.) automatically for you.
### Mutations <a href="https://docs.nestjs.com/graphql/mutations"><img src="https://nestjs.com/img/logo-small.svg" id="mutations" width="20" alt="Nest Logo" /></a>

Most discussions of GraphQL focus on data fetching, but any complete data platform needs a way to modify server-side data as well. In REST, any request could end up causing side-effects on the server, but best practice suggests we should not modify data in GET requests. GraphQL is similar - technically any query could be implemented to cause a data write. However, like REST, it's recommended to observe the convention that any operations that cause writes should be sent explicitly via a mutation (read more [here](https://graphql.org/learn/queries/#mutations)).

The official [Apollo](https://www.apollographql.com/docs/graphql-tools/generate-schema.html) documentation uses an `upvotePost()` mutation example. This mutation implements a method to increase a post's `votes` property value. To create an equivalent mutation in Nest, we'll make use of the `@Mutation()` decorator.

#### Code first

Let's add another method to the `AuthorResolver` used in the previous section (see [resolvers](/graphql/resolvers)).

```typescript
@Mutation(returns => Post)
async upvotePost(@Args({ name: 'postId', type: () => Int }) postId: number) {
  return this.postsService.upvoteById({ id: postId });
}
```

> info **Hint** All decorators (e.g., `@Resolver`, `@ResolveField`, `@Args`, etc.) are exported from the `@nestjs/graphql` package.

This will result in generating the following part of the GraphQL schema in SDL:

```graphql
type Mutation {
  upvotePost(postId: Int!): Post
}
```

The `upvotePost()` method takes `postId` (`Int`) as an argument and returns an updated `Post` entity. For the reasons explained in the [resolvers](/graphql/resolvers) section, we have to explicitly set the expected type.

If the mutation needs to take an object as an argument, we can create an **input type**. The input type is a special kind of object type that can be passed in as an argument (read more [here](https://graphql.org/learn/schema/#input-types)). To declare an input type, use the `@InputType()` decorator.

```typescript
import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class UpvotePostInput {
  @Field()
  postId: number;
}
```

> info **Hint** The `@InputType()` decorator takes an options object as an argument, so you can, for example, specify the input type's description. Note that, due to TypeScript's metadata reflection system limitations, you must either use the `@Field` decorator to manually indicate a type, or use a [CLI plugin](/graphql/cli-plugin).

We can then use this type in the resolver class:

```typescript
@Mutation(returns => Post)
async upvotePost(
  @Args('upvotePostData') upvotePostData: UpvotePostInput,
) {}
```

#### Schema first

Let's extend our `AuthorResolver` used in the previous section (see [resolvers](/graphql/resolvers)).

```typescript
@Mutation()
async upvotePost(@Args('postId') postId: number) {
  return this.postsService.upvoteById({ id: postId });
}
```

Note that we assumed above that the business logic has been moved to the `PostsService` (querying the post and incrementing its `votes` property). The logic inside the `PostsService` class can be as simple or sophisticated as needed. The main point of this example is to show how resolvers can interact with other providers.

The last step is to add our mutation to the existing types definition.

```graphql
type Author {
  id: Int!
  firstName: String
  lastName: String
  posts: [Post]
}

type Post {
  id: Int!
  title: String
  votes: Int
}

type Query {
  author(id: Int!): Author
}

type Mutation {
  upvotePost(postId: Int!): Post
}
```

The `upvotePost(postId: Int!): Post` mutation is now available to be called as part of our application's GraphQL API.
### Subscriptions <a href="https://docs.nestjs.com/graphql/subscriptions"><img src="https://nestjs.com/img/logo-small.svg" id="subscriptions" width="20" alt="Nest Logo" /></a>

In addition to fetching data using queries and modifying data using mutations, the GraphQL spec supports a third operation type, called `subscription`. GraphQL subscriptions are a way to push data from the server to the clients that choose to listen to real time messages from the server. Subscriptions are similar to queries in that they specify a set of fields to be delivered to the client, but instead of immediately returning a single answer, a channel is opened and a result is sent to the client every time a particular event happens on the server.

A common use case for subscriptions is notifying the client side about particular events, for example the creation of a new object, updated fields and so on (read more [here](https://www.apollographql.com/docs/react/data/subscriptions)).

#### Enable subscriptions

To enable subscriptions, set the `installSubscriptionHandlers` property to `true`.

```typescript
GraphQLModule.forRoot({
  installSubscriptionHandlers: true,
}),
```

#### Code first

To create a subscription using the code first approach, we use the `@Subscription()` decorator and the `PubSub` class from the `graphql-subscriptions` package, which provides a simple **publish/subscribe API**.

The following subscription handler takes care of **subscribing** to an event by calling `PubSub#asyncIterator`. This method takes a single argument, the `triggerName`, which corresponds to an event topic name.

```typescript
const pubSub = new PubSub();

@Resolver(of => Author)
export class AuthorResolver {
  // ...
  @Subscription(returns => Comment)
  commentAdded() {
    return pubSub.asyncIterator('commentAdded');
  }
}
```

> info **Hint** All decorators are exported from the `@nestjs/graphql` package, while the `PubSub` class is exported from the `graphql-subscriptions` package.

> warning **Note** `PubSub` is a class that exposes a simple `publish` and `subscribe API`. Read more about it [here](https://www.apollographql.com/docs/graphql-subscriptions/setup.html). Note that the Apollo docs warn that the default implementation is not suitable for production (read more [here](https://github.com/apollographql/graphql-subscriptions#getting-started-with-your-first-subscription)). Production apps should use a `PubSub` implementation backed by an external store (read more [here](https://github.com/apollographql/graphql-subscriptions#pubsub-implementations)).

This will result in generating the following part of the GraphQL schema in SDL:

```graphql
type Subscription {
  commentAdded(): Comment!
}
```

Note that subscriptions, by definition, return an object with a single top level property whose key is the name of the subscription. This name is either inherited from the name of the subscription handler method (i.e., `commentAdded` above), or is provided explicitly by passing an option with the key `name` as the second argument to the `@Subscription()` decorator, as shown below.

```typescript
  @Subscription(returns => Comment, {
    name: 'commentAdded',
  })
  addCommentHandler() {
    return pubSub.asyncIterator('commentAdded');
  }
```

This construct produces the same SDL as the previous code sample, but allows us to decouple the method name from the subscription.

#### Publishing

Now, to publish the event, we use the `PubSub#publish` method. This is often used within a mutation to trigger a client-side update when a part of the object graph has changed. For example:

```typescript
@@filename(posts/posts.resolver)
@Mutation(returns => Post)
async addComment(
  @Args('postId', { type: () => Int }) postId: number,
  @Args('comment', { type: () => Comment }) comment: CommentInput,
) {
  const newComment = this.commentsService.addComment({ id: postId, comment });
  pubSub.publish('commentAdded', { commentAdded: newComment });
  return newComment;
}
```

The `PubSub#publish` method takes a `triggerName` (again, think of this as an event topic name) as the first parameter, and an event payload as the second parameter. As mentioned, the subscription, by definition, returns a value and that value has a shape. Look again at the generated SDL for our `commentAdded` subscription:

```graphql
type Subscription {
  commentAdded(): Comment!
}
```

This tells us that the subscription must return an object with a top-level property name of `commentAdded` that has a value which is a `Comment` object. The important point to note is that the shape of the event payload emitted by the `PubSub#publish` method must correspond to the shape of the value expected to return from the subscription. So, in our example above, the `pubSub.publish('commentAdded', {{ '{' }} commentAdded: newComment {{ '}' }})` statement publishes a `commentAdded` event with the appropriately shaped payload. If these shapes don't match, your subscription will fail during the GraphQL validation phase.

#### Filtering subscriptions

To filter out specific events, set the `filter` property to a filter function. This function acts similar to the function passed to an array `filter`. It takes two arguments: `payload` containing the event payload (as sent by the event publisher), and `variables` taking any arguments passed in during the subscription request. It returns a boolean determining whether this event should be published to client listeners.

```typescript
@Subscription(returns => Comment, {
  filter: (payload, variables) =>
    payload.commentAdded.title === variables.title,
})
commentAdded(@Args('title') title: string) {
  return pubSub.asyncIterator('commentAdded');
}
```

#### Mutating subscription payloads

To mutate the published event payload, set the `resolve` property to a function. The function receives the event payload (as sent by the event publisher) and returns the appropriate value.

```typescript
@Subscription(returns => Comment, {
  resolve: value => value,
})
commentAdded() {
  return pubSub.asyncIterator('commentAdded');
}
```

> warning **Note** If you use the `resolve` option, you should return the unwrapped payload (e.g., with our example, return a `newComment` object directly, not a `{{ '{' }} commentAdded: newComment {{ '}' }}` object).

If you need to access injected providers (e.g., use an external service to validate the data), use the following construction.

```typescript
@Subscription(returns => Comment, {
  resolve(this: AuthorResolver, value) {
    // "this" refers to an instance of "AuthorResolver"
    return value;
  }
})
commentAdded() {
  return pubSub.asyncIterator('commentAdded');
}
```

The same construction works with filters:

```typescript
@Subscription(returns => Comment, {
  filter(this: AuthorResolver, payload, variables) {
    // "this" refers to an instance of "AuthorResolver"
    return payload.commentAdded.title === variables.title;
  }
})
commentAdded() {
  return pubSub.asyncIterator('commentAdded');
}
```

#### Schema first

To create an equivalent subscription in Nest, we'll make use of the `@Subscription()` decorator.

```typescript
const pubSub = new PubSub();

@Resolver('Author')
export class AuthorResolver {
  // ...
  @Subscription()
  commentAdded() {
    return pubSub.asyncIterator('commentAdded');
  }
}
```

To filter out specific events based on context and arguments, set the `filter` property.

```typescript
@Subscription('commentAdded', {
  filter: (payload, variables) =>
    payload.commentAdded.title === variables.title,
})
commentAdded() {
  return pubSub.asyncIterator('commentAdded');
}
```

To mutate the published payload, we can use a `resolve` function.

```typescript
@Subscription('commentAdded', {
  resolve: value => value,
})
commentAdded() {
  return pubSub.asyncIterator('commentAdded');
}
```

If you need to access injected providers (e.g., use an external service to validate the data), use the following construction:

```typescript
@Subscription('commentAdded', {
  resolve(this: AuthorResolver, value) {
    // "this" refers to an instance of "AuthorResolver"
    return value;
  }
})
commentAdded() {
  return pubSub.asyncIterator('commentAdded');
}
```

The same construction works with filters:

```typescript
@Subscription('commentAdded', {
  filter(this: AuthorResolver, payload, variables) {
    // "this" refers to an instance of "AuthorResolver"
    return payload.commentAdded.title === variables.title;
  }
})
commentAdded() {
  return pubSub.asyncIterator('commentAdded');
}
```

The last step is to update the type definitions file.

```graphql
type Author {
  id: Int!
  firstName: String
  lastName: String
  posts: [Post]
}

type Post {
  id: Int!
  title: String
  votes: Int
}

type Query {
  author(id: Int!): Author
}

type Comment {
  id: String
  content: String
}

type Subscription {
  commentAdded(title: String!): Comment
}
```

With this, we've created a single `commentAdded(title: String!): Comment` subscription. You can find a full sample implementation [here](https://github.com/nestjs/nest/blob/master/sample/12-graphql-schema-first).

#### PubSub

We instantiated a local `PubSub` instance above. The preferred approach is to define `PubSub` as a [provider](/fundamentals/custom-providers) and inject it through the constructor (using the `@Inject()` decorator). This allows us to re-use the instance across the whole application. For example, define a provider as follows, then inject `'PUB_SUB'` where needed.

```typescript
{
  provide: 'PUB_SUB',
  useValue: new PubSub(),
}
```

#### Customize subscriptions server

To customize the subscriptions server (e.g., change the listener port), use the `subscriptions` options property (read [more](https://www.apollographql.com/docs/apollo-server/v2/api/apollo-server.html#constructor-options-lt-ApolloServer-gt)).

```typescript
GraphQLModule.forRoot({
  installSubscriptionHandlers: true,
  subscriptions: {
    keepAlive: 5000,
  }
}),
```
### Scalars <a href="https://docs.nestjs.com/graphql/scalars"><img src="https://nestjs.com/img/logo-small.svg" id="scalars" width="20" alt="Nest Logo" /></a>

A GraphQL object type has a name and fields, but at some point those fields have to resolve to some concrete data. That's where the scalar types come in: they represent the leaves of the query (read more [here](https://graphql.org/learn/schema/#scalar-types)). GraphQL includes the following default types: `Int`, `Float`, `String`, `Boolean` and `ID`. In addition to these built-in types, you may need to support custom atomic data types (e.g., `Date`).

#### Code first

The code-first approach ships with five scalars in which three of them are simple aliases for the existing GraphQL types.

- `ID` (alias for `GraphQLID`) - represents a unique identifier, often used to refetch an object or as the key for a cache
- `Int` (alias for `GraphQLInt`) - a signed 32‐bit integer
- `Float` (alias for `GraphQLFloat`) - a signed double-precision floating-point value
- `GraphQLISODateTime` - a date-time string at UTC (used by default to represent `Date` type)
- `GraphQLTimestamp` - a numeric string which represents time and date as number of milliseconds from start of UNIX epoch

The `GraphQLISODateTime` (e.g. `2019-12-03T09:54:33Z`) is used by default to represent the `Date` type. To use the `GraphQLTimestamp` instead, set the `dateScalarMode` of the `buildSchemaOptions` object to `'timestamp'` as follows:

```typescript
GraphQLModule.forRoot({
  buildSchemaOptions: {
    dateScalarMode: 'timestamp',
  }
}),
```

In addition, you can create custom scalars. For example, to create a `Date` scalar, simply create a new class.

```typescript
import { Scalar, CustomScalar } from '@nestjs/graphql';
import { Kind, ValueNode } from 'graphql';

@Scalar('Date', type => Date)
export class DateScalar implements CustomScalar<number, Date> {
  description = 'Date custom scalar type';

  parseValue(value: number): Date {
    return new Date(value); // value from the client
  }

  serialize(value: Date): number {
    return value.getTime(); // value sent to the client
  }

  parseLiteral(ast: ValueNode): Date {
    if (ast.kind === Kind.INT) {
      return new Date(ast.value);
    }
    return null;
  }
}
```

With this in place, register `DateScalar` as a provider.

```typescript
@Module({
  providers: [DateScalar],
})
export class CommonModule {}
```

Now we can use the `Date` type in our classes.

```typescript
@Field()
creationDate: Date;
```

#### Schema first

To define a custom scalar (read more about scalars [here](https://www.apollographql.com/docs/graphql-tools/scalars.html)), create a type definition and a dedicated resolver. Here (as in the official documentation), we’ll use the `graphql-type-json` package for demonstration purposes. This npm package defines a `JSON` GraphQL scalar type.

Start by installing the package:

```bash
$ npm i --save graphql-type-json
```

Once the package is installed, we pass a custom resolver to the `forRoot()` method:

```typescript
import GraphQLJSON from 'graphql-type-json';

@Module({
  imports: [
    GraphQLModule.forRoot({
      typePaths: ['./**/*.graphql'],
      resolvers: { JSON: GraphQLJSON },
    }),
  ],
})
export class ApplicationModule {}
```

Now we can use the `JSON` scalar in our type definitions:

```graphql
scalar JSON

type Foo {
  field: JSON
}
```

Another method to define a scalar type is to create a simple class. Assume we want to enhance our schema with the `Date` type.

```typescript
import { Scalar, CustomScalar } from '@nestjs/graphql';
import { Kind, ValueNode } from 'graphql';

@Scalar('Date')
export class DateScalar implements CustomScalar<number, Date> {
  description = 'Date custom scalar type';

  parseValue(value: number): Date {
    return new Date(value); // value from the client
  }

  serialize(value: Date): number {
    return value.getTime(); // value sent to the client
  }

  parseLiteral(ast: ValueNode): Date {
    if (ast.kind === Kind.INT) {
      return new Date(ast.value);
    }
    return null;
  }
}
```

With this in place, register `DateScalar` as a provider.

```typescript
@Module({
  providers: [DateScalar],
})
export class CommonModule {}
```

Now we can use the `Date` scalar in type definitions.

```graphql
scalar Date
```
### Directives <a href="https://docs.nestjs.com/graphql/directives"><img src="https://nestjs.com/img/logo-small.svg" id="directives" width="20" alt="Nest Logo" /></a>

A directive can be attached to a field or fragment inclusion, and can affect execution of the query in any way the server desires (read more [here](https://graphql.org/learn/queries/#directives)). The GraphQL specification provides several default directives:

- `@include(if: Boolean)` - only include this field in the result if the argument is true
- `@skip(if: Boolean)` - skip this field if the argument is true
- `@deprecated(reason: String)` - marks field as deprecated with message

A directive is an identifier preceded by a `@` character, optionally followed by a list of named arguments, which can appear after almost any element in the GraphQL query and schema languages.

#### Custom directives

To create a custom schema directive, declare a class which extends the `SchemaDirectiveVisitor` class exported from the `apollo-server` package.

```typescript
import { SchemaDirectiveVisitor } from 'apollo-server';
import { defaultFieldResolver, GraphQLField } from 'graphql';

export class UpperCaseDirective extends SchemaDirectiveVisitor {
  visitFieldDefinition(field: GraphQLField<any, any>) {
    const { resolve = defaultFieldResolver } = field;
    field.resolve = async function(...args) {
      const result = await resolve.apply(this, args);
      if (typeof result === 'string') {
        return result.toUpperCase();
      }
      return result;
    };
  }
}
```

> info **Hint** Note that directives cannot be decorated with the `@Injectable()` decorator. Thus, they are not able to inject dependencies.

Now, register the `UpperCaseDirective` in the `GraphQLModule.forRoot()` method:

```typescript
GraphQLModule.forRoot({
  // ...
  schemaDirectives: {
    upper: UpperCaseDirective,
  },
});
```

Once registered, the `@upper` directive can be used in our schema. However, the way you apply the directive will vary depending on the approach you use (code first or schema first).

#### Code first

In the code first approach, use the `@Directive()` decorator to apply the directive.

```typescript
@Directive('@upper')
@Field()
title: string;
```

> info **Hint** The `@Directive()` decorator is exported from the `@nestjs/graphql` package.

Directives can be applied on fields, field resolvers, input and object types, as well as queries, mutations, and subscriptions. Here's an example of the directive applied on the query handler level:

```typescript
@Directive('@deprecated(reason: "This query will be removed in the next version")')
@Query(returns => Author, { name: 'author' })
async getAuthor(@Args({ name: 'id', type: () => Int }) id: number) {
  return this.authorsService.findOneById(id);
}
```

Directives applied through the `@Directive()` decorator will not be reflected in the generated schema definition file.

#### Schema first

In the schema first approach, apply directives directly in SDL.

```graphql
directive @upper on FIELD_DEFINITION

type Post {
  id: Int!
  title: String! @upper
  votes: Int
}
```
### Plugins <a href="https://docs.nestjs.com/graphql/plugins"><img src="https://nestjs.com/img/logo-small.svg" id="plugins" width="20" alt="Nest Logo" /></a>

Plugins enable you to extend Apollo Server's core functionality by performing custom operations in response to certain events. Currently, these events correspond to individual phases of the GraphQL request lifecycle, and to the startup of Apollo Server itself (read more [here](https://www.apollographql.com/docs/apollo-server/integrations/plugins/)). For example, a basic logging plugin might log the GraphQL query string associated with each request that's sent to Apollo Server.

#### Custom plugins

To create a plugin, declare a class annotated with the `@Plugin` decorator exported from the `@nestjs/graphql` package. Also, for better code autocompletion, implement the `ApolloServerPlugin` interface from the `apollo-server-plugin-base` package.

```typescript
import { Plugin } from '@nestjs/graphql';
import {
  ApolloServerPlugin,
  GraphQLRequestListener,
} from 'apollo-server-plugin-base';

@Plugin()
export class LoggingPlugin implements ApolloServerPlugin {
  requestDidStart(): GraphQLRequestListener {
    console.log('Request started');
    return {
      willSendResponse() {
        console.log('Will send response');
      },
    };
  }
}
```

With this in place, we can register the `LoggingPlugin` as a provider.

```typescript
@Module({
  providers: [LoggingPlugin],
})
export class CommonModule {}
```

Nest will automatically instantiate a plugin and apply it to the Apollo Server.

#### Using external plugins

There are several plugins provided out-of-the-box. To use an existing plugin, simply import it and add it to the `plugins` array:

```typescript
GraphQLModule.forRoot({
  // ...
  plugins: [ApolloServerOperationRegistry({ /* options */})]
}),
```

> info **Hint** The `ApolloServerOperationRegistry` plugin is exported from the `apollo-server-plugin-operation-registry` package.
### Interfaces <a href="https://docs.nestjs.com/graphql/interfaces"><img src="https://nestjs.com/img/logo-small.svg" id="interfaces" width="20" alt="Nest Logo" /></a>

Like many type systems, GraphQL supports interfaces. An **Interface** is an abstract type that includes a certain set of fields that a type must include to implement the interface (read more [here](https://graphql.org/learn/schema/#interfaces)).

#### Code first

When using the code first approach, you define a GraphQL interface by creating an abstract class annotated with the `@InterfaceType()` decorator exported from the `@nestjs/graphql`.

```typescript
import { Field, ID, InterfaceType } from '@nestjs/graphql';

@InterfaceType()
export abstract class Character {
  @Field(type => ID)
  id: string;

  @Field()
  name: string;
}
```

> warning **Warning** TypeScript interfaces cannot be used to define GraphQL interfaces.

This will result in generating the following part of the GraphQL schema in SDL:

```graphql
interface Character {
  id: ID!
  name: String!
}
```

Now, to implement the `Character` interface, use the `implements` key:

```typescript
@ObjectType({
  implements: [Character],
})
export class Human implements Character {
  id: string;
  name: string;
}
```

> info **Hint** The `@ObjectType()` decorator is exported from the `@nestjs/graphql` package.

The default `resolveType()` function generated by the library extracts the type based on the value returned from the resolver method. This means that you must return class instances (you cannot return literal JavaScript objects).

To provide a customized `resolveType()` function, pass the `resolveType` property to the options object passed into the `@InterfaceType()` decorator, as follows:

```typescript
@InterfaceType({
  resolveType(book) {
    if (book.colors) {
      return ColoringBook;
    }
    return TextBook;
  },
})
export abstract class Book {
  @Field(type => ID)
  id: string;

  @Field()
  title: string;
}
```

#### Schema first

To define an interface in the schema first approach, simply create a GraphQL interface with SDL.

```graphql
interface Character {
  id: ID!
  name: String!
}
```

Then, you can use the typings generation feature (as shown in the [quick start](/graphql/quick-start) chapter) to generate corresponding TypeScript definitions:

```typescript
export interface Character {
  id: string;
  name: string;
}
```

Interfaces require an extra `__resolveType` field in the resolver map to determine which type the interface should resolve to. Let's create a `CharactersResolver` class and define the `__resolveType` method:

```typescript
@Resolver('Character')
export class CharactersResolver {
  @ResolveField()
  __resolveType(value) {
    if ('age' in value) {
      return Person;
    }
    return null;
  }
}
```

> info **Hint** All decorators are exported from the `@nestjs/graphql` package.
### Unions <a href="https://docs.nestjs.com/graphql/unions"><img src="https://nestjs.com/img/logo-small.svg" id="unions" width="20" alt="Nest Logo" /></a>

Union types are very similar to interfaces, but they don't get to specify any common fields between the types (read more [here](https://graphql.org/learn/schema/#union-types)). Unions are useful for returning disjoint data types from a single field.

#### Code first

To define a GraphQL union type, we must define classes that this union will be composed of. Following the [example](https://www.apollographql.com/docs/apollo-server/schema/unions-interfaces/#union-type) from the Apollo documentation, we'll create two classes. First, `Book`:

```typescript
import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class Book {
  @Field()
  title: string;
}
```

And then `Author`:

```typescript
import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class Author {
  @Field()
  name: string;
}
```

With this in place, register the `Result` union using the `createUnionType` function exported from the `@nestjs/graphql` package:

```typescript
export const ResultUnion = createUnionType({
  name: 'Result',
  types: () => [Author, Book],
});
```

Now, we can reference the `ResultUnion` in our query:

```typescript
@Query(returns => [ResultUnion])
search(): Array<typeof ResultUnion> {
  return [new Author(), new Book()];
}
```

This will result in generating the following part of the GraphQL schema in SDL:

```graphql
type Author {
  name: String!
}

type Book {
  title: String!
}

union ResultUnion = Author | Book

type Query {
  search: [ResultUnion!]!
}
```

The default `resolveType()` function generated by the library will extract the type based on the value returned from the resolver method. That means returning class instances instead of literal JavaScript object is obligatory.

To provide a customized `resolveType()` function, pass the `resolveType` property to the options object passed into the `createUnionType()` function, as follows:

```typescript
export const ResultUnion = createUnionType({
  name: 'Result',
  types: () => [Author, Book],
  resolveType(value) {
    if (value.name) {
      return Author;
    }
    if (value.title) {
      return Book;
    }
    return null;
  },
});
```

#### Schema first

To define a union in the schema first approach, simply create a GraphQL union with SDL.

```graphql
type Author {
  name: String!
}

type Book {
  title: String!
}

union ResultUnion = Author | Book
```

Then, you can use the typings generation feature (as shown in the [quick start](/graphql/quick-start) chapter) to generate corresponding TypeScript definitions:

```typescript
export class Author {
  name: string;
}

export class Book {
  title: string;
}

export type ResultUnion = Author | Book;
```

Unions require an extra `__resolveType` field in the resolver map to determine which type the union should resolve to. Let's create a `ResultUnionResolver` class and define the `__resolveType` method:

```typescript
@Resolver('ResultUnion')
export class ResultUnionResolver {
  @ResolveField()
  __resolveType(value) {
    if (value.name) {
      return 'Author';
    }
    if (value.title) {
      return 'Book';
    }
    return null;
  }
}
```

> info **Hint** All decorators are exported from the `@nestjs/graphql` package.
### Enums <a href="https://docs.nestjs.com/graphql/enums"><img src="https://nestjs.com/img/logo-small.svg" id="enums" width="20" alt="Nest Logo" /></a>

Enumeration types are a special kind of scalar that is restricted to a particular set of allowed values (read more [here](https://graphql.org/learn/schema/#enumeration-types)). This allows you to:

- validate that any arguments of this type are one of the allowed values
- communicate through the type system that a field will always be one of a finite set of values

#### Code first

When using the code first approach, you define a GraphQL enum type by simply creating a TypeScript enum.

```typescript
export enum AllowedColor {
  RED,
  GREEN,
  BLUE,
}
```

With this in place, register the `AllowedColor` enum using the `registerEnumType` function exported from the `@nestjs/graphql` package:

```typescript
registerEnumType(AllowedColor, {
  name: 'AllowedColor',
});
```

Now you can reference the `AllowedColor` in our types:

```typescript
@Field(type => AllowedColor)
favoriteColor: AllowedColor;
```

This will result in generating the following part of the GraphQL schema in SDL:

```graphql
enum AllowedColor {
  RED
  GREEN
  BLUE
}
```

#### Schema first

To define an enumerator in the schema first approach, simply create a GraphQL enum with SDL.

```graphql
enum AllowedColor {
  RED
  GREEN
  BLUE
}
```

Then you can use the typings generation feature (as shown in the [quick start](/graphql/quick-start) chapter) to generate corresponding TypeScript definitions:

```typescript
export enum AllowedColor {
  RED
  GREEN
  BLUE
}
```

Sometimes a backend forces a different value for an enum internally than in the public API. In this example the API contains `RED`, however in resolvers we may use `#f00` instead (read more [here](https://www.apollographql.com/docs/apollo-server/schema/scalars-enums/#internal-values)). To accomplish this, declare a resolver object for the `AllowedColor` enum:

```typescript
export const allowedColorResolver: Record<keyof typeof AllowedColor, any> = {
  RED: '#f00',
}
```

> info **Hint** All decorators are exported from the `@nestjs/graphql` package.

Then use this resolver object together with the `resolvers` property of the `GraphQLModule#forRoot()` method, as follows:

```typescript
GraphQLModule.forRoot({
  resolvers: {
    AllowedColor: allowedColorResolver,
  },
})
```
### Mapped types <a href="https://docs.nestjs.com/graphql/mapped-types"><img src="https://nestjs.com/img/logo-small.svg" id="mapped-types" width="20" alt="Nest Logo" /></a>

> warning **Warning** This chapter applies only to the code first approach.

As you build out features like CRUD (Create/Read/Update/Delete) it's often useful to construct variants on a base entity type. Nest provides several utility functions that perform type transformations to make this task more convenient.

#### Partial

When building input validation types (also called DTOs), it's often useful to build **create** and **update** variations on the same type. For example, the **create** variant may require all fields, while the **update** variant may make all fields optional.

Nest provides the `PartialType()` utility function to make this task easier and minimize boilerplate.

The `PartialType()` function returns a type (class) with all the properties of the input type set to optional. For example, suppose we have a **create** type as follows:

```typescript
@InputType()
class CreateUserInput {
  @Field()
  email: string;

  @Field()
  password: string;

  @Field()
  firstName: string;
}
```

By default, all of these fields are required. To create a type with the same fields, but with each one optional, use `PartialType()` passing the class reference (`CreateUserInput`) as an argument:

```typescript
@InputType()
export class UpdateUserInput extends PartialType(CreateUserInput) {}
```

> info **Hint** The `PartialType()` function is imported from the `@nestjs/graphql` package.

The `PartialType()` function takes an optional second argument that is a reference to a decorator factory.  This argument can be used to change the decorator function applied to the resulting (child) class.  If not specified, the child class effectively uses the same decorator as the **parent** class (the class referenced in the first argument). In the example above, we are extending `CreateUserInput` which is annotated with the `@InputType()` decorator.  Since we want `UpdateUserInput` to also be treated as if it were decorated with `@InputType()`, we didn't need to pass `InputType` as the second argument. If the parent and child types are different, (e.g., the parent is decorated with `@ObjectType`), we would  pass `InputType` as the second argument. For example:

```typescript
@InputType()
export class UpdateUserInput extends PartialType(User, InputType) {}
```

#### Pick

The `PickType()` function constructs a new type (class) by picking a set of properties from an input type. For example, suppose we start with a type like:

```typescript
@InputType()
class CreateUserInput {
  @Field()
  email: string;

  @Field()
  password: string;

  @Field()
  firstName: string;
}
```

We can pick a set of properties from this class using the `PickType()` utility function:

```typescript
@InputType()
export class UpdateEmailInput extends PickType(CreateUserInput, ['email'] as const) {}
```

> info **Hint** The `PickType()` function is imported from the `@nestjs/graphql` package.

#### Omit

The `OmitType()` function constructs a type by picking all properties from an input type and then removing a particular set of keys. For example, suppose we start with a type like:

```typescript
@InputType()
class CreateUserInput {
  @Field()
  email: string;

  @Field()
  password: string;

  @Field()
  firstName: string;
}
```

We can generate a derived type that has every property **except** `email` as shown below. In this construct, the second argument to `OmitType` is an array of property names.

```typescript
@InputType()
export class UpdateUserInput extends OmitType(CreateUserInput, ['email'] as const) {}
```

> info **Hint** The `OmitType()` function is imported from the `@nestjs/graphql` package.

#### Intersection

The `IntersectionType()` function combines two types into one new type (class). For example, suppose we start with two types like:

```typescript
@InputType()
class CreateUserInput {
  @Field()
  email: string;

  @Field()
  password: string;
}

@ObjectType()
export class AdditionalUserInfo {
  @Field()
  firstName: string;

  @Field()
  lastName: string;
}
```

We can generate a new type that combines all properties in both types.

```typescript
@InputType()
export class UpdateUserInput extends IntersectionType(CreateUserInput, AdditionalUserInfo) {}
```

> info **Hint** The `IntersectionType()` function is imported from the `@nestjs/graphql` package.

#### Composition

The type mapping utility functions are composable. For example, the following will produce a type (class) that has all of the properties of the `CreateUserInput` type except for `email`, and those properties will be set to optional:

```typescript
@InputType()
export class UpdateUserInput extends PartialType(
  OmitType(CreateUserInput, ['email'] as const),
) {}
```
### Complexity <a href="https://docs.nestjs.com/graphql/complexity"><img src="https://nestjs.com/img/logo-small.svg" id="complexity" width="20" alt="Nest Logo" /></a>

> warning **Warning** This chapter applies only to the code first approach.

Query complexity allows you to define how complex certain fields are, and to restrict queries with a **maximum complexity**. The idea is to define how complex each field is by using a simple number. A common default is to give each field a complexity of `1`. In addition, the complexity calculation of a GraphQL query can be customized with so-called complexity estimators. A complexity estimator is a simple function that calculates the complexity for a field. You can add any number of complexity estimators to the rule, which are then executed one after another. The first estimator that returns a numeric complexity value determines the complexity for that field.

The `@nestjs/graphql` package integrates very well with tools like [graphql-query-complexity](https://github.com/slicknode/graphql-query-complexity) that provides a cost analysis-based solution. With this library, you can reject queries to your GraphQL server that are deemed too costly to execute.

#### Installation

To begin using it, we first install the required dependency.

```bash
$ npm install --save graphql-query-complexity
```

#### Getting started

Once the installation process is complete, we can define the `ComplexityPlugin` class:

```typescript
import { GraphQLSchemaHost, Plugin } from '@nestjs/graphql';
import {
  ApolloServerPlugin,
  GraphQLRequestListener,
} from 'apollo-server-plugin-base';
import { GraphQLError } from 'graphql';
import {
  fieldExtensionsEstimator,
  getComplexity,
  simpleEstimator,
} from 'graphql-query-complexity';

@Plugin()
export class ComplexityPlugin implements ApolloServerPlugin {
  constructor(private gqlSchemaHost: GraphQLSchemaHost) {}

  requestDidStart(): GraphQLRequestListener {
    const { schema } = this.gqlSchemaHost;

    return {
      didResolveOperation({ request, document }) {
        const complexity = getComplexity({
          schema,
          operationName: request.operationName,
          query: document,
          variables: request.variables,
          estimators: [
            fieldExtensionsEstimator(),
            simpleEstimator({ defaultComplexity: 1 }),
          ],
        });
        if (complexity >= 20) {
          throw new GraphQLError(
            `Query is too complex: ${complexity}. Maximum allowed complexity: 20`,
          );
        }
        console.log('Query Complexity:', complexity);
      },
    };
  }
}
```

For demonstration purposes, we specified the maximum allowed complexity as `20`. In the example above, we used 2 estimators, the `simpleEstimator` and the `fieldExtensionsEstimator`.

- `simpleEstimator`: the simple estimator returns a fixed complexity for each field
- `fieldExtensionsEstimator`: the field extensions estimator extracts the complexity value for each field of your schema

> info **Hint** Remember to add this class to the providers array in any module.

#### Field-level complexity

With this plugin in place, we can now define the complexity for any field by specifying the `complexity` property in the options object passed into the `@Field()` decorator, as follows:

```typescript
@Field({ complexity: 3 })
title: string;
```

Alternatively, you can define the estimator function:

```typescript
@Field({ complexity: (options: ComplexityEstimatorArgs) => ... })
title: string;
```
### Extensions <a href="https://docs.nestjs.com/graphql/extensions"><img src="https://nestjs.com/img/logo-small.svg" id="extensions" width="20" alt="Nest Logo" /></a>

> warning **Warning** This chapter applies only to the code first approach.

Extensions is an **advanced, low-level feature** that lets you define arbitrary data in the types configuration. Attaching custom metadata to certain fields allows you to create more sophisticated, generic solutions. For example, with extensions, you can define field-level roles required to access particular fields. Such roles can be reflected at runtime to determine whether the caller has sufficient permissions to retrieve a specific field.

#### Adding custom metadata

To attach custom metadata for a field, use the `@Extensions()` decorator exported from the `@nestjs/graphql` package.

```typescript
@Field()
@Extensions({ role: Role.ADMIN })
password: string;
```

In the example above, we assigned the `role` metadata property the value of `Role.ADMIN`.  `Role` is a simple TypeScript enum that groups all the user roles available in our system.

Note, in addition to setting metadata on fields, you can use the `@Extensions()` decorator at the class level and method level (e.g., on the query handler).

#### Using custom metadata

The logic that leverages the custom metatada can be as complex as needed. For example, you can create a simple interceptor that stores/logs events per method invocation, or create a sophisticated guard that **analyzes requested fields**, iterates through the `GraphQLObjectType` definition, and matches the roles required to retrieve specific fields with the caller permissions (field-level permissions system).

Let's define a `FieldRolesGuard` that implements a basic version of such a field-level permissions system.

```typescript
import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { GqlExecutionContext } from '@nestjs/graphql';
import { GraphQLNonNull, GraphQLObjectType, GraphQLResolveInfo } from 'graphql';
import * as graphqlFields from 'graphql-fields';

@Injectable()
export class FieldRolesGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const info = GqlExecutionContext.create(context).getInfo<
      GraphQLResolveInfo
    >();
    const returnType = (info.returnType instanceof GraphQLNonNull
      ? info.returnType.ofType
      : info.returnType) as GraphQLObjectType;

    const fields = returnType.getFields();
    const requestedFields = graphqlFields(info);

    Object.entries(fields)
      .filter(([key]) => key in requestedFields)
      .map(([_, field]) => field)
      .filter((field) => field.extensions && field.extensions.role)
      .forEach((field) => {
        // match user and field roles here
        console.log(field.extensions.role);
      });

    return true;
  }
}
```

> warning **Warning** For illustration purposes, we assumed that **every** resolver returns either the `GraphQLObjectType` or `GraphQLNonNull` that wraps the object type. In a real-world application, you should cover other cases (scalars, etc.). Note that using this particular implementation can lead to unexpected errors (e.g., missing `getFields()` method).

In the example above, we've used the [graphql-fields](https://github.com/robrichard/graphql-fields) package that turns the `GraphQLResolveInfo` object into an object that consists of the requested fields. We used this specific library to make the presented example somewhat simpler.

With this guard in place, if the return type of any resolver contains a field annotated with the `@Extensions({{ '{' }} role: Role.ADMIN {{ '}' }}})` decorator, this `role` (`Role.ADMIN`) will be logged in the console **if requested** in the GraphQL query.
### CLI Plugin <a href="https://docs.nestjs.com/graphql/cli-plugin"><img src="https://nestjs.com/img/logo-small.svg" id="cli-plugin" width="20" alt="Nest Logo" /></a>

> warning **Warning** This chapter applies only to the code first approach.

TypeScript's metadata reflection system has several limitations which make it impossible to, for instance, determine what properties a class consists of or recognize whether a given property is optional or required. However, some of these constraints can be addressed at compilation time. Nest provides a plugin that enhances the TypeScript compilation process to reduce the amount of boilerplate code required.

> info **Hint** This plugin is **opt-in**. If you prefer, you can declare all decorators manually, or only specific decorators where you need them.

#### Overview

The GraphQL plugin will automatically:

- annotate all input object, object type and args classes properties with `@Field` unless `@HideField` is used
- set the `nullable` property depending on the question mark (e.g. `name?: string` will set `nullable: true`)
- set the `type` property depending on the type (supports arrays as well)

Please, note that your filenames **must have** one of the following suffixes in order to be analyzed by the plugin: `['.input.ts', '.args.ts', '.entity.ts', '.model.ts']` (e.g., `author.entity.ts`). If you are using a different suffix, you can adjust the plugin's behavior by specifying the `typeFileNameSuffix` option (see below).

With what we've learned so far, you have to duplicate a lot of code to let the package know how your type should be declared in GraphQL. For example, you could define a simple `Author` class as follows:

```typescript
@@filename(authors/models/author.model)
@ObjectType()
export class Author {
  @Field(type => Int)
  id: number;

  @Field({ nullable: true })
  firstName?: string;

  @Field({ nullable: true })
  lastName?: string;

  @Field(type => [Post])
  posts: Post[];
}
```

While not a significant issue with medium-sized projects, it becomes verbose & hard to maintain once you have a large set of classes.

By enabling the GraphQL plugin, the above class definition can be declared simply:

```typescript
@@filename(authors/models/author.model)
@ObjectType()
export class Author {
  @Field(type => Int)
  id: number;
  firstName?: string;
  lastName?: string;
  posts: Post[];
}
```

The plugin adds appropriate decorators on-the-fly based on the **Abstract Syntax Tree**. Thus, you won't have to struggle with `@Field` decorators scattered throughout the code.

> info **Hint** The plugin will automatically generate any missing swagger properties, but if you need to override them, simply set them explicitly via `@Field()`.
#### Using the CLI plugin
To enable the plugin, open `nest-cli.json` (if you use [Nest CLI](/cli/overview)) and add the following `plugins` configuration:

```javascript
{
  "collection": "@nestjs/schematics",
  "sourceRoot": "src",
  "compilerOptions": {
    "plugins": ["@nestjs/graphql/plugin"]
  }
}
```

You can use the `options` property to customize the behavior of the plugin.

```javascript
"plugins": [
  {
    "name": "@nestjs/graphql/plugin",
    "options": {
      "typeFileNameSuffix": [".input.ts", ".args.ts"]
    }
  }
]
```

The `options` property has to fulfill the following interface:

```typescript
export interface PluginOptions {
  typeFileNameSuffix?: string[];
}
```

<table>
  <tr>
    <th>Option</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>typeFileNameSuffix</code></td>
    <td><code>['.input.ts', '.args.ts', '.entity.ts', '.model.ts']</code></td>
    <td>GraphQL types files suffix</td>
  </tr>
</table>

If you don't use the CLI but instead have a custom `webpack` configuration, you can use this plugin in combination with `ts-loader`:

```javascript
getCustomTransformers: (program: any) => ({
  before: [require('@nestjs/graphql/plugin').before({}, program)]
}),
```
### Generating SDL <a href="https://docs.nestjs.com/graphql/generating-sdl"><img src="https://nestjs.com/img/logo-small.svg" id="generating-sdl" width="20" alt="Nest Logo" /></a>

> warning **Warning** This chapter applies only to the code first approach.

To manually generate a GraphQL SDL schema (i.e., without running an application, connecting to the database, hooking up resolvers, etc.), use the `GraphQLSchemaBuilderModule`.

```typescript
async function generateSchema() {
  const app = await NestFactory.create(GraphQLSchemaBuilderModule);
  await app.init();

  const gqlSchemaFactory = app.get(GraphQLSchemaFactory);
  const schema = await gqlSchemaFactory.create([RecipesResolver]);
  console.log(printSchema(schema));
}
```

> info **Hint** The `GraphQLSchemaBuilderModule` and `GraphQLSchemaFactory` are imported from the `@nestjs/graphql` package. The `printSchema` function is imported from the `graphql` package.

#### Usage

The `gqlSchemaFactory.create()` method takes an array of resolver class references. For example:

```typescript
const schema = await gqlSchemaFactory.create([
  RecipesResolver,
  AuthorsResolver,
  PostsResolvers,
]);
```

It also takes a second optional argument with an array of scalar classes:

```typescript
const schema = await gqlSchemaFactory.create(
  [RecipesResolver, AuthorsResolver, PostsResolvers],
  [DurationScalar, DateScalar],
);
```

Lastly, you can pass an options object:

```typescript
const schema = await gqlSchemaFactory.create([RecipesResolver], {
  skipCheck: true,
  orphanedTypes: [],
});
```

- `skipCheck`: ignore schema validation; boolean, defaults to `false`
- `orphanedTypes`: list of classes that are not explicitly referenced (not part of the object graph) to be generated. Normally, if a class is declared but isn't otherwise referenced in the graph, it's omitted. The property value is an array of class references.
### Other features <a href="https://docs.nestjs.com/graphql/other-features"><img src="https://nestjs.com/img/logo-small.svg" id="other-features" width="20" alt="Nest Logo" /></a>

In the GraphQL world, there is a lot of debate about handling issues like **authentication**, or **side-effects** of operations. Should we handle things inside the business logic? Should we use a higher-order function to enhance queries and mutations with authorization logic? Or should we use [schema directives](https://www.apollographql.com/docs/apollo-server/schema/directives/)? There is no single one-size-fits-all answer to these questions.

Nest helps address these issues with its cross-platform features like [guards](/guards) and [interceptors](/interceptors). The philosophy is to reduce redundancy and provide tooling that helps create well-structured, readable, and consistent applications.

#### Overview

You can use standard [guards](/guards), [interceptors](/interceptors), [filters](/exception-filters) and [pipes](/pipes) in the same fashion with GraphQL as with any RESTful application. Additionally, you can easily create your own decorators by leveraging the [custom decorators](/custom-decorators) feature. Let's take a look at a sample GraphQL query handler.

```typescript
@Query('author')
@UseGuards(AuthGuard)
async getAuthor(@Args('id', ParseIntPipe) id: number) {
  return this.authorsService.findOneById(id);
}
```

As you can see, GraphQL works with both guards and pipes in the same way as HTTP REST handlers. Because of this, you can move your authentication logic to a guard; you can even reuse the same guard class across both a REST and GraphQL API interface. Similarly, interceptors work across both types of applications in the same way:

```typescript
@Mutation()
@UseInterceptors(EventsInterceptor)
async upvotePost(@Args('postId') postId: number) {
  return this.postsService.upvoteById({ id: postId });
}
```

#### Execution context

Since GraphQL receives a different type of data in the incoming request, the [execution context](https://docs.nestjs.com/fundamentals/execution-context) received by both guards and interceptors is somewhat different with GraphQL vs. REST. GraphQL resolvers have a distinct set of arguments: `root`, `args`, `context`, and `info`. Thus guards and interceptors must transform the generic `ExecutionContext` to a `GqlExecutionContext`. This is straightforward:

```typescript
import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { GqlExecutionContext } from '@nestjs/graphql';

@Injectable()
export class AuthGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const ctx = GqlExecutionContext.create(context);
    return true;
  }
}
```

The GraphQL context object returned by `GqlExecutionContext.create()` exposes a **get** method for each GraphQL resolver argument (e.g., `getArgs()`, `getContext()`, etc). Once transformed, we can easily pick out any GraphQL argument for the current request.

#### Exception filters

Nest standard [exception filters](/exception-filters) are compatible with GraphQL applications as well. As with `ExecutionContext`, GraphQL apps should transform the `ArgumentsHost` object to a `GqlArgumentsHost` object.

```typescript
@Catch(HttpException)
export class HttpExceptionFilter implements GqlExceptionFilter {
  catch(exception: HttpException, host: ArgumentsHost) {
    const gqlHost = GqlArgumentsHost.create(host);
    return exception;
  }
}
```

> info **Hint** Both `GqlExceptionFilter` and `GqlArgumentsHost` are imported from the `@nestjs/graphql` package.

Note that unlike the REST case, you don't use the native `response` object to generate a response.

#### Custom decorators

As mentioned, the [custom decorators](/custom-decorators) feature works as expected with GraphQL resolvers.

```typescript
export const User = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) =>
    GqlExecutionContext.create(ctx).getContext().user,
);
```

Use the `@User()` custom decorator as follows:

```typescript
@Mutation()
async upvotePost(
  @User() user: UserEntity,
  @Args('postId') postId: number,
) {}
```

> info **Hint** In the above example, we have assumed that the `user` object is assigned to the context of your GraphQL application.

#### Execute enhancers at the field resolver level

In the GraphQL context, Nest does not run **enhancers** (the generic name for interceptors, guards and filters) at the field level [see this issue](https://github.com/nestjs/graphql/issues/320#issuecomment-511193229): they only run for the top level `@Query()`/`@Mutation()` method. You can tell Nest to execute interceptors, guards or filters for methods annotated with `@ResolveField()` by setting the `fieldResolverEnhancers` option in `GqlModuleOptions`.  Pass it a list of `'interceptors'`, `'guards'`, and/or `'filters'` as appropriate:

```typescript
GraphQLModule.forRoot({
  fieldResolverEnhancers: ['interceptors']
}),
```

> **Warning** Enabling enhancers for field resolvers can cause performance issues when you are returning lots of records and your field resolver is executed thousands of times. For this reason, when you enable `fieldResolverEnhancers`, we advise you to skip execution of enhancers that are not strictly necessary for your field resolvers. You can do this using the following helper function:

```typescript
export function isResolvingGraphQLField(context: ExecutionContext): boolean {
  if (context.getType<GqlContextType>() === 'graphql') {
    const gqlContext = GqlExecutionContext.create(context);
    const info = gqlContext.getInfo();
    const parentType = info.parentType.name;
    return parentType !== 'Query' && parentType !== 'Mutation';
  }
  return false;
}
```
### Federation <a href="https://docs.nestjs.com/graphql/federation"><img src="https://nestjs.com/img/logo-small.svg" id="federation" width="20" alt="Nest Logo" /></a>

[Apollo Federation](https://www.apollographql.com/docs/apollo-server/federation/introduction/) offers a means of splitting your monolithic GraphQL server into independent microservices. It consists of two components: a gateway and one or more federated microservices. Each microservice holds part of the schema and the gateway merges the schemas into a single schema that can be consumed by the client.

To quote the [Apollo docs](https://blog.apollographql.com/apollo-federation-f260cf525d21), Federation is designed with these core principles:

- Building a graph should be **declarative.** With federation, you compose a graph declaratively from within your schema instead of writing imperative schema stitching code.
- Code should be separated by **concern**, not by types. Often no single team controls every aspect of an important type like a User or Product, so the definition of these types should be distributed across teams and codebases, rather than centralized.
- The graph should be simple for clients to consume. Together, federated services can form a complete, product-focused graph that accurately reflects how it’s being consumed on the client.
- It’s just **GraphQL**, using only spec-compliant features of the language. Any language, not just JavaScript, can implement federation.

> warning **Warning** Apollo Federation currently does not support subscriptions.

In the next example, we'll set up a demo application with a gateway and two federated endpoints: a Users service and a Posts service.

#### Federated example: Users

First install the optional dependency for federation:

```bash
$ npm install --save @apollo/federation
```

The User service has a simple schema. Note the `@key` directive: it tells the Apollo query planner that a particular instance of User can be fetched if you have its `id`. Also note that we extend the `Query` type.

```graphql
type User @key(fields: "id") {
  id: ID!
  name: String!
}

extend type Query {
  getUser(id: ID!): User
}
```

Our resolver has one extra method: `resolveReference`. It's called by the Apollo Gateway whenever a related resource requires a User instance. We'll see an example of this in the Posts service later on. Please note the `@ResolveReference` decorator.

```typescript
import { Args, Query, Resolver, ResolveReference } from '@nestjs/graphql';
import { UsersService } from './users.service';

@Resolver('User')
export class UsersResolvers {
  constructor(private usersService: UsersService) {}

  @Query()
  getUser(@Args('id') id: string) {
    return this.usersService.findById(id);
  }

  @ResolveReference()
  resolveReference(reference: { __typename: string; id: string }) {
    return this.usersService.findById(reference.id);
  }
}
```

Finally, we hook everything up in a module together with a `GraphQLFederationModule`. This module accepts the same options as the regular `GraphQLModule`.

```typescript
import { Module } from '@nestjs/common';
import { GraphQLFederationModule } from '@nestjs/graphql';
import { UsersResolvers } from './users.resolvers';

@Module({
  imports: [
    GraphQLFederationModule.forRoot({
      typePaths: ['**/*.graphql'],
    }),
  ],
  providers: [UsersResolvers],
})
export class AppModule {}
```

#### Federated example: Posts

The Posts service references the User type in its schema by marking it with the `extend` keyword. It also adds one property to the User type. Note the `@key` directive used for matching instances of User, and the `@external` directive indicating that the `id` field is managed elsewhere.

```graphql
type Post @key(fields: "id") {
  id: ID!
  title: String!
  body: String!
  user: User
}

extend type User @key(fields: "id") {
  id: ID! @external
  posts: [Post]
}

extend type Query {
  getPosts: [Post]
}
```

Our resolver has one method of interest here: `getUser`. It returns a reference containing `__typename` and any additional properties your application needs to resolve the reference, in this case only an `id`. The `__typename` is used by the GraphQL Gateway to pinpoint the microservice responsible for the User type and request the instance. The Users service discussed above will be called on the `resolveReference` method.

```typescript
import { Query, Resolver, Parent, ResolveProperty } from '@nestjs/graphql';
import { PostsService } from './posts.service';
import { Post } from './posts.interfaces';

@Resolver('Post')
export class PostsResolvers {
  constructor(private postsService: PostsService) {}

  @Query('getPosts')
  getPosts() {
    return this.postsService.findAll();
  }

  @ResolveProperty('user')
  getUser(@Parent() post: Post) {
    return { __typename: 'User', id: post.userId };
  }
}
```

The Posts service has virtually the same module, but is included below for the sake of completeness:

```typescript
import { Module } from '@nestjs/common';
import { GraphQLFederationModule } from '@nestjs/graphql';
import { PostsResolvers } from './posts.resolvers';

@Module({
  imports: [
    GraphQLFederationModule.forRoot({
      typePaths: ['**/*.graphql'],
    }),
  ],
  providers: [PostsResolvers],
})
export class AppModule {}
```

#### Federated example: Gateway

First install the optional dependency for the gateway: `npm install --save @apollo/gateway`.

Our gateway only needs a list of endpoints and will auto-discover the schemas from there. The code for our gateway is therefore very short:

```typescript
import { Module } from '@nestjs/common';
import { GraphQLGatewayModule } from '@nestjs/graphql';

@Module({
  imports: [
    GraphQLGatewayModule.forRoot({
      server: {
        // ... Apollo server options
        cors: true,
      },
      gateway: {
        serviceList: [
          { name: 'users', url: 'http://user-service/graphql' },
          { name: 'posts', url: 'http://post-service/graphql' },
        ],
      },
    }),
  ],
})
export class AppModule {}
```

> info **Hint** Apollo recommends that you don't rely on the service discovery in a production environment but use their [Graph Manager](https://www.apollographql.com/docs/graph-manager/federation/) instead.

#### Sharing context

You can customize the requests between the gateway and federated services using a build service. This allows you to share context about the request. You can easily extend the default `RemoteGraphQLDataSource` and implement one of the hooks. Please refer to [Apollo Docs](https://www.apollographql.com/docs/apollo-server/api/apollo-gateway/#remotegraphqldatasource) on `RemoteGraphQLDataSource` for more information about the possibilities.

```typescript
import { Module } from '@nestjs/common';
import { GATEWAY_BUILD_SERVICE, GraphQLGatewayModule } from '@nestjs/graphql';
import { RemoteGraphQLDataSource } from '@apollo/gateway';
import { decode } from 'jsonwebtoken';

class AuthenticatedDataSource extends RemoteGraphQLDataSource {
  async willSendRequest({ request, context }) {
    const { userId } = await decode(context.jwt);
    request.http.headers.set('x-user-id', userId);
  }
}

@Module({
  providers: [
    {
      provide: AuthenticatedDataSource,
      useValue: AuthenticatedDataSource,
    },
    {
      provide: GATEWAY_BUILD_SERVICE,
      useFactory: AuthenticatedDataSource => {
        return ({ name, url }) => new AuthenticatedDataSource({ url });
      },
      inject: [AuthenticatedDataSource],
    },
  ],
  exports: [GATEWAY_BUILD_SERVICE],
})
class BuildServiceModule {}

@Module({
  imports: [
    GraphQLGatewayModule.forRootAsync({
      useFactory: async () => ({
        gateway: {
          serviceList: [
            /* services */
          ],
        },
        server: {
          context: ({ req }) => ({
            jwt: req.headers.authorization,
          }),
        },
      }),
      imports: [BuildServiceModule],
      inject: [GATEWAY_BUILD_SERVICE],
    }),
  ],
})
export class AppModule {}
```

#### Async configuration

Both the Federation and Gateway modules support asynchronous initialization using the same `forRootAsync` that's documented in [Quick start](/graphql/quick-start#async-configuration).


------
