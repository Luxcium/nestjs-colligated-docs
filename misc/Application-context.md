<!--
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

### Standalone applications

There are several ways of mounting a Nest application. You can create a web app, a microservice or just a bare Nest **standalone application** (without any network listeners). The Nest standalone application is a wrapper around the Nest **IoC container**, which holds all instantiated classes. We can obtain a reference to any existing instance from within any imported module directly using the standalone application object. Thus, you can take advantage of the Nest framework anywhere, including, for example, scripted **CRON** jobs. You can even build a **CLI** on top of it.

#### Getting started

To create a Nest standalone application, use the following construction:

```typescript
@@filename()
async function bootstrap() {
  const app = await NestFactory.createApplicationContext(ApplicationModule);
  // application logic...
}
bootstrap();
```

The standalone application object allows you to obtain a reference to any instance registered within the Nest application. Let's imagine that we have a `TasksService` in the `TasksModule`. This class provides a set of methods that we want to call from within a CRON job.

```typescript
@@filename()
const app = await NestFactory.create(ApplicationModule);
const tasksService = app.get(TasksService);
```

To access the `TasksService` instance we use the `get()` method. The `get()` method acts like a **query** that searches for an instance in each registered module. Alternatively, for strict context checking, pass an options object with the `strict: true` property. With this option in effect, you have to navigate through specific modules to obtain a particular instance from the selected context.

```typescript
@@filename()
const app = await NestFactory.create(AppModule);
const tasksService = app.select(TasksModule).get(TasksService, { strict: true });
```

Following is a summary of the methods available for retrieving instance references from the standalone application object.

<table>
  <tr>
    <td>
      <code>get()</code>
    </td>
    <td>
      Retrieves an instance of a controller or provider (including guards, filters, and so on) available in the application context.
    </td>
  </tr>
  <tr>
    <td>
      <code>select()</code>
    </td>
    <td>
      Navigates through the modules graph to pull out a specific instance from the selected module (used together with strict mode as described above).
    </td>
  </tr>
</table>

> info **Hint** In non-strict mode, the root module is selected by default. To select any other module, you need to navigate the modules graph manually, step by step.

If you want the node application to close after the script finishes (e.g., for a script running CRON jobs), add `await app.close()` to the end of your `bootstrap` function:

```typescript
@@filename()
async function bootstrap() {
  const app = await NestFactory.createApplicationContext(ApplicationModule);
  // application logic...
  await app.close();
}
bootstrap();
```


----------
