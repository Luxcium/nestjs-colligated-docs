
## More <a href="#bookmarks"><img src="misc/arrow-narrow-up.png" id="More-section" width="20" alt="arrow narrow up" title="Back to top" /></a>
 - <a href="#standalone-applications">Standalone apps</a>
 - <a href="#migration-guide"> Migration guide </a>
 - <a href="https://github.com/nestjs/nest/tree/master/sample"><img src="https://nestjs.com/img/logo-small.svg" width="15" alt="Nest Logo" /> Examples</a>
 - <a href="https://docs.nestjs.com/discover/companies"><img src="https://nestjs.com/img/logo-small.svg" width="15" alt="Nest Logo" /> Who is using Nest?</a>


> Click the logo to get redirected to the official docs <a href="https://docs.nestjs.com/"><img src="https://nestjs.com/img/logo-small.svg" width="25" alt="Nest Logo" /></a>


------


### Standalone applications <a href="https://docs.nestjs.com/standalone-applications"><img src="https://nestjs.com/img/logo-small.svg" id="standalone-applications" width="20" alt="Nest Logo" /></a>

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
### Migration guide <a href="https://docs.nestjs.com/migration-guide"><img src="https://nestjs.com/img/logo-small.svg" id="migration-guide" width="20" alt="Nest Logo" /></a>

This article provides a set of guidelines for migrating from Nest version 6 to version 7.

#### Custom route decorators

The [Custom decorators](/custom-decorators) API has been unified for all types of applications. Now, whether you're creating a GraphQL application or a REST API, the factory passed into the `createParamDecorator()` function will take the `ExecutionContext` (read more [here](/fundamentals/execution-context)) object as a second argument.

```typescript
@@filename()
// Before
import { createParamDecorator } from '@nestjs/common';

export const User = createParamDecorator((data, req) => {
  return req.user;
});

// After
import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const User = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    return request.user;
  },
);
@@switch
// Before
import { createParamDecorator } from '@nestjs/common';

export const User = createParamDecorator((data, req) => {
  return req.user;
});

// After
import { createParamDecorator } from '@nestjs/common';

export const User = createParamDecorator((data, ctx) => {
  const request = ctx.switchToHttp().getRequest();
  return request.user;
});
```

#### Microservices

To avoid code duplication, the `MicroserviceOptions` interface has been removed from the `@nestjs/common` package. Therefore, now when you're creating a microservice (through either `createMicroservice()` or `connectMicroservice()` method), you should pass the type generic parameter to get code autocompletion.

```typescript
@@filename()
// Before
const app = await NestFactory.createMicroservice(AppModule);

// After
const app = await NestFactory.createMicroservice<MicroserviceOptions>(AppModule);
@@switch
// Before
const app = await NestFactory.createMicroservice(AppModule);

// After
const app = await NestFactory.createMicroservice(AppModule);
```

> info **Hint** The `MicroserviceOptions` interface is exported from the `@nestjs/microservices` package.

#### GraphQL

In the version 6 major release of NestJS, we introduced the code-first approach as a compatibility layer between the `type-graphql` package and the `@nestjs/graphql` module. Eventually, our team decided to reimplement all the features from scratch due to a lack of flexibility. To avoid numerous breaking changes, the public API is backward-compatible and may resemble `type-graphql`.

In order to migrate your existing application, simply rename all the `type-graphql` imports to the `@nestjs/graphql`. If you used more advanced features, you might need to also:

- use `Type` (imported from `@nestjs/common`) instead of `ClassType` (imported from `type-graphql`)
- move methods that require `@Args()` from object types (classes annotated with `@ObjectType()` decorator) under resolver classes (and use `@ResolveField()` decorator instead of `@Field()`)

#### Terminus

In the version 7 major release of `@nestjs/terminus`, a new simplified API has been introduced
to run health checks. The previously required peer dependency `@godaddy/terminus` has been removed, which allows us to integrate our health checks automatically into Swagger! Read more about the removal of `@godaddy/terminus` [here](https://github.com/nestjs/terminus/issues/340).

For most users, the biggest change will be the removal of the `TerminusModule.forRootAsync` function. With the next major version, this function will be completely removed.
To migrate to the new API, you will need to create a new controller, which will handle your health checks.

```typescript
@@filename()
// Before
@Injectable()
export class TerminusOptionsService implements TerminusOptionsFactory {
  constructor(
    private dns: DNSHealthIndicator,
  ) {}

  createTerminusOptions(): TerminusModuleOptions {
    const healthEndpoint: TerminusEndpoint = {
      url: '/health',
      healthIndicators: [
        async () => this.dns.pingCheck('google', 'https://google.com'),
      ],
    };
    return {
      endpoints: [healthEndpoint],
    };
  }
}

@Module({
  imports: [
    TerminusModule.forRootAsync({
      useClass: TerminusOptionsService
    })
  ]
})
export class AppModule { }

// After
@Controller('health')
export class HealthController {
  constructor(
    private health: HealthCheckService,
    private dns: DNSHealthIndicator,
  ) { }

  @Get()
  @HealthCheck()
  healthCheck() {
    return this.health.check([
      async () => this.dns.pingCheck('google', 'https://google.com'),
    ]);
  }
}

@Module({
  imports: [
    TerminusModule
  ]
})
export class AppModule { }

@@switch

// Before
@Injectable()
@Dependencies(DNSHealthIndicator)
export class TerminusOptionsService {
  constructor(
    private dns,
  ) {}

  createTerminusOptions() {
    const healthEndpoint = {
      url: '/health',
      healthIndicators: [
        async () => this.dns.pingCheck('google', 'https://google.com'),
      ],
    };
    return {
      endpoints: [healthEndpoint],
    };
  }
}

@Module({
  imports: [
    TerminusModule.forRootAsync({
      useClass: TerminusOptionsService
    })
  ]
})
export class AppModule { }

// After
@Controller('/health')
@Dependencies(HealthCheckService, DNSHealthIndicator)
export class HealthController {
  constructor(
    private health,
    private dns,
  ) { }

  @Get('/')
  @HealthCheck()
  healthCheck() {
    return this.health.check([
      async () => this.dns.pingCheck('google', 'https://google.com'),
    ])
  }
}

@Module({
  controllers: [
    HealthController
  ],
  imports: [
    TerminusModule
  ]
})
export class AppModule { }
```

> warning **Warning** If you have set a [Global Prefix](faq#global-prefix) in your Nest application and you have not used the `useGlobalPrefix` Terminus option, the URL of your health check will change. Make sure to update the reference to that URL, or use the legacy Terminus API until [nestjs/nest#963](https://github.com/nestjs/nest/issues/963) is fixed.

If you are forced to use the legacy API, you can also disable deprecation messages for the time being.

```typescript
TerminusModule.forRootAsync({
  useFactory: () => ({
    disableDeprecationWarnings: true,
    endpoints: [
      // ...
    ]
  })
}
```

You should enable shutdown hooks in your `main.ts` file. The Terminus integration will listen on POSIX signals such as SIGTERM (see the [Application shutdown chapter](fundamentals/lifecycle-events#application-shutdown) for more information). When enabled, the health check route(s) will automatically respond with a Service Unavailable (503) HTTP error response when the server is shutting down.

With the removal of `@godaddy/terminus`, you will need to update your `import` statements
to use `@nestjs/terminus` instead. Most notable is the import of the `HealthCheckError`.

```typescript
@@filename(custom.health)
// Before
import { HealthCheckError } from '@godaddy/terminus';
// After
import { HealthCheckError } from '@nestjs/terminus';
```

Once you have fully migrated, make sure you uninstall `@godaddy/terminus`.

```bash
npm uninstall --save @godaddy/terminus
```

#### HTTP exceptions body

Previously, the generated response bodies for the `HttpException` class and other exceptions derived from it (e.g., `BadRequestException` or `NotFoundException`) were inconsistent. In the latest major release, these exception responses will follow the same structure.

```typescript
/*
 * Sample outputs for "throw new ForbiddenException('Forbidden resource')"
 */

// Before
{
  "statusCode": 403,
  "message": "Forbidden resource"
}

// After
{
  "statusCode": 403,
  "message": "Forbidden resource",
  "error": "Forbidden"
}
```

#### Validation errors schema

In past releases, the `ValidationPipe` threw an array of the `ValidationError` objects returned by the `class-validator` package. Now, `ValidationPipe` will map errors to a list of plain strings representing error messages.

```typescript
// Before
{
  "statusCode": 400,
  "error": "Bad Request",
  "message": [
    {
      "target": {},
      "property": "email",
      "children": [],
      "constraints": {
        "isEmail": "email must be an email"
      }
    }
  ]
}

// After
{
  "statusCode": 400,
  "message": ["email must be an email"],
  "error": "Bad Request"
}
```

If you prefer the previous approach, you can restore it by setting the `exceptionFactory` function:

```typescript
new ValidationPipe({
  exceptionFactory: (errors) => new BadRequestException(errors),
});
```

#### Implicit type conversion (`ValidationPipe`)

With the auto-transformation option enabled (`transform: true`), the `ValidationPipe` will now perform conversion of primitive types. In the following example, the `findOne()` method takes one argument which represents an extracted `id` path parameter:

```typescript
@Get(':id')
findOne(@Param('id') id: number) {
  console.log(typeof id === 'number'); // true
  return 'This action returns a user';
}
```

By default, every path parameter and query parameter comes over the network as a `string`. In the above example, we specified the `id` type as a `number` (in the method signature). Therefore, the `ValidationPipe` will try to automatically convert a string identifier to a number.

#### Microservice channels (bidirectional communication)

To enable the request-response message type, Nest creates two logical channels - one is responsible for transferring the data while the other waits for incoming responses. For some underlying transports, such as NATS, this dual-channel support is provided out-of-the-box. For others, Nest compensates by manually creating separate channels.

Let's say that we have a single message handler `@MessagePattern('getUsers')`. In the past, Nest built two channels from this pattern: `getUsers_ack` (for requests) and `getUsers_res` (for responses). With version 7, this naming scheme changes. Now Nest will build `getUsers` (for requests) and `getUsers.reply` (for responses) instead. Also, specifically for the MQTT transport strategy, the response channel would be `getUsers/reply` (to avoid conflicts with topic wildcards).

#### Deprecations

All deprecations (from Nest version 5 to version 6) have been finally removed (e.g., the deprecated `@ReflectMetadata` decorator).

#### Node.js

This release drops support for Node v8. We strongly recommend using the latest LTS version.
### Official NestJS Consulting

Our goal is to ensure that your developers are successful and productive with NestJS as well as other modern technologies in today's ever-changing tech world.

### Official Support

With official support, get expert help directly from the NestJS core team. We tackle your toughest challenges, and collaborate with your team on many levels such as:

- Providing technical guidance & architectural reviews
- **Mentoring** team members
- Advising best practices
- Solving design decisions
- Addressing security & performance concerns
- Performing **in-depth** code reviews

<div class="row">
  <div class="content">
    <h4>Team Augmentation & Development</h4>
    <p>
      With team augmentation, NestJS core team members can work directly with your team on a daily basis to help take your project to the next-level. Consider us “part of your team”, tackling the most ambitious projects - right by your side.
    </p>
  </div>
  <div class="thumbnail p-l-30">
    <img src="https://github.com/Luxcium/docs.nestjs.com/blob/master/src/assets/enterprise/help.svg" />
  </div>
</div>

<div class="row">
<div class="thumbnail p-r-30">
    <img src="https://github.com/Luxcium/docs.nestjs.com/blob/master/src/assets/enterprise/contact.svg" />
  </div>
  <div class="content">
    <h4>NestJS Best Practices</h4>
    <p>
      Frequent code reviews can eliminate potentially hazardous bugs & issues at an early stage and help enforce best practices. Let us perform PR reviews & audits to ensure your code quality, performance, and security.
    </p>
  </div>
</div>

#### First-hand access

Direct communication channel will boost team velocity, giving a quick access to discuss and solve problems.

#### NestJS Workshops and Trainings

We provide solid kick-off training as well as more advanced ones that give teams an in-depth understanding of NestJS. We offer on-site workshops and remote intensive sessions which help get you up and running _quickly_ within the NestJS ecosystem.

<div class="contact-us">
  <div class="column column-text">
    <h5>Contact us!</h5>
    <p>
    Let's talk how we can help you become successful with NestJS.
    </p>
  </div>
   <div class="column column-action">
     <a href="mailto:support@nestjs.com">CONTACT US</a>
   </div>
</div>

Reach out to us at [support@nestjs.com](mailto:support@nestjs.com), and let’s talk about your project & teams needs!
### Support

Nest is an MIT-licensed open source project with its ongoing development made possible thanks to the support by the community. This framework is a result of the long road, full of sleepless nights, working **after hours**, and busy weekends.

#### How can you help?

Nest doesn't have a large company that sits behind and is continuously paying for hours spent on the development. I fully rely on the **goodness** ❤️ of the people. However, I would love to make this framework even more **powerful**, to be fully focused on delivering you great solutions that make coding process enjoyable: In order to help me, I run few supporting platforms:

- become a backer or sponsor on [OpenCollective](https://opencollective.com/nest)
- use [PayPal](https://paypal.me/kamilmysliwiec) to send a one-time donation
- or reach me directly: [mail@kamilmysliwiec.com](mailto:mail@kamilmysliwiec.com)

If you fell in love with Nest, or you run a business which is using Nest, consider sponsoring its development to ensure that the project which your product relies on is **actively maintained** and improved. Also, your support could help me to work more on content that benefits whole Nest community, writing either educational blog posts or recording videos.



----------
