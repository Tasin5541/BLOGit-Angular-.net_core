USE [blogit]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/23/2020 22:16:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[admin] [bit] NOT NULL,
	[ban] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (1, N'tasin', N'tasin@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 1, 0)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (2, N'ifti', N'ifti@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 1)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (3, N'sakib', N'sakib@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 0)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (4, N'masnad-E-ala', N'pappu@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 0)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (5, N'shipon', N'shipon@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 0)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (6, N'ifti2', N'ifti2@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 0)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (7, N'fahimTheBoss09', N'srk@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 0)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (8, N'pok', N'pok@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 0)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (9, N'johnDoe089', N'doe@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 1)
INSERT [dbo].[Users] ([Id], [userName], [email], [password], [admin], [ban]) VALUES (10, N'tasin09', N'tasin@gmail.com', N'20cfb0302558a6325c8eedd2e5f5a40a', 0, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[Posts]    Script Date: 11/23/2020 22:16:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Banner_Image] [nvarchar](max) NULL,
	[PostedOn] [nvarchar](max) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Posts] ON
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Author], [Banner_Image], [PostedOn]) VALUES (1, N'AngularJS to Angular - a brief history', N'Angular is one of the most well-known solutions for SPA (single-page application) development besides React and Vue.js. It has been around for almost 10 years and it has gone through countless adjustments since then. The first version of the framework - AngularJS - started back in 2009 and laid the foundation of present-day front-end application development.

I remember trying it out myself, memorizing its unique syntax for templates, trying to understand its quirks like the two-way data binding, dependency injection and many further concepts that come with the framework. I had my ups and downs learning it - especially with its change detection system - but after a few sleepless nights, I was able to develop a high-quality web application which harnessed the power of the underlying engine.

It was not perfect due to its huge bundle size compared to other libraries, and I often bumped into performance issues, but I got a web app running that satisfied common software development criteria. I could write clean code thanks to John Papa''s style guide and develop a relatively fast running app in short time focusing on its functional requirements.

I was not the only one having issues with the framework. You can find a ton of deficiency too in the framework, that makes AngularJS half success, half failure. Its architecture and chaotic digest loop system set limitations to its performance, however its template syntax worked out so well that it was adopted by Vue.js. (v-if - ng-if, v-model - ng-model)

AngularJS refers to the 1.x versions of the framework, from 2.x it is known as Angular.

The imperfection of AngularJS was the motivation behind the complete rewrite of the framework. Due to its unpredictable change detection system and robustness, the developers at Google needed to rewrite the framework. They began using really powerful libraries. On top of the original features, they introduced approaches like AOT (Ahead-of-Time) compiling, tree-shaking and many more. AOT converts the HTML and TypeScript code into JavaScript during build time, while tree-shaking gets rid of the unused imports to achieve faster application bootstrapping and smaller footprint.

It also got a fancy CLI that can initialize new projects, generate skeletons, build and create a development application server so it’s became a pretty handy tool!', N'tasin', N'Angular-Version-History-1280x720.jpgMon Nov 23 2020 17_51_40 GMT.jpg', N'Mon Nov 23 2020 17:52:18 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Author], [Banner_Image], [PostedOn]) VALUES (3, N'Let''s clear up a misconception', N'There is a common misunderstanding that Angular''s change detection is the same thing as Zone.js. In fact, Angular forks Zone.js creating its own NgZone which emits an event when the microtasks are executed in the browser’s event loop. This event notifies the component''s change detector to run and update the components concerned.

Change detection is a really complicated topic on Angular but if you are interested getting to the bottom of it, check out this great article!

I have to admit, the dependencies of Angular might look overwhelming at first glance. All these libraries take time to master and we have not even started to learn the framework. Unfortunately, this is the point where many developers turn their back on it and start looking for another solution with a smaller learning curve.

Tip: Search on google with `-angularjs` option to omit the search results with the 1.x version. - via @RisingStack
But hey, don''t give up! Take my advice and play around with the dependencies first to get an insight into the core libraries.', N'ifti', N'1_VKY-Ldkt-iHobItql7G_5w.pngMon Nov 23 2020 18_04_15 GMT.png', N'Mon Nov 23 2020 18:05:35 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Author], [Banner_Image], [PostedOn]) VALUES (4, N'Resources to boost your confidence', N'Check out RxJS Marbles for the built-in RxJS operators! The interactive visual diagrams are great but advance with caution, the operators can get deprecated and new ones are added from time to time. You might not find all of them in the latest version of RxJS and the library is in lack of up-to-date documentations. Go ahead and search in the source code if you have any doubts!

I really love TypeScript because its static type check assures me I am not going to make any typos. If you are new to TS, check out its type system, and go through interfaces and classes. This is more than enough to figure out the basics of Angular but still, it is really interesting to see what is the output of a compiled TS file. Do files including only interfaces have any code compiled to JS? - I will just leave this question here.

Understanding what is under the hood will definitely boost your confidence when it comes to the framework itself!

Indeed, #Angular might have a longer learning period compared to other front-end libraries but in return it enhances the developer experience with built-in solutions that come by importing modules.
Applications built on top of the framework are basically a tree of components that are organized into individual modules by their domain. Angular has quite a few core modules i.e.: CommonModule, FormsModule, RouterModule, etc. These modules contain custom attributes (directives), data transformation utilities (pipes), services and many other tools to speed up the process of application development. It actually lets you focus on the application logic of the product, ensuring that it runs flawlessly in the browser.

Of course, this framework is not a silver bullet for every scenario. Its true strength shines when it comes to developing data-driven, large-scale applications with complex logic.', N'sakib', N'6ee96bb816.pngMon Nov 23 2020 18_17_54 GMT.png', N'Mon Nov 23 2020 18:18:15 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Author], [Banner_Image], [PostedOn]) VALUES (6, N'microsoft visual studio 2019', N'Visual Studio does not support any programming language, solution or tool intrinsically; instead, it allows the plugging of functionality coded as a VSPackage. When installed, the functionality is available as a Service. The IDE provides three services: SVsSolution, which provides the ability to enumerate projects and solutions; SVsUIShell, which provides windowing and UI functionality (including tabs, toolbars, and tool windows); and SVsShell, which deals with registration of VSPackages. In addition, the IDE is also responsible for coordinating and enabling communication between services.[11] All editors, designers, project types and other tools are implemented as VSPackages. Visual Studio uses COM to access the VSPackages. The Visual Studio SDK also includes the Managed Package Framework (MPF), which is a set of managed wrappers around the COM-interfaces that allow the Packages to be written in any CLI compliant language.[12] However, MPF does not provide all the functionality exposed by the Visual Studio COM interfaces.[13] The services can then be consumed for creation of other packages, which add functionality to the Visual Studio IDE.

Support for programming languages is added by using a specific VSPackage called a Language Service. A language service defines various interfaces which the VSPackage implementation can implement to add support for various functionalities.[14] Functionalities that can be added this way include syntax coloring, statement completion, brace matching, parameter information tooltips, member lists, and error markers for background compilation.[14] If the interface is implemented, the functionality will be available for the language. Language services are implemented on a per-language basis. The implementations can reuse code from the parser or the compiler for the language.[14] Language services can be implemented either in native code or managed code. For native code, either the native COM interfaces or the Babel Framework (part of Visual Studio SDK) can be used.[15] For managed code, the MPF includes wrappers for writing managed language services.[16]

Visual Studio does not include any source control support built in but it defines two alternative ways for source control systems to integrate with the IDE.[17] A Source Control VSPackage can provide its own customised user interface. In contrast, a source control plugin using the MSSCCI (Microsoft Source Code Control Interface) provides a set of functions that are used to implement various source control functionality, with a standard Visual Studio user interface.[18][19] MSSCCI was first used to integrate Visual SourceSafe with Visual Studio 6.0 but was later opened up via the Visual Studio SDK. Visual Studio .NET 2002 used MSSCCI 1.1, and Visual Studio .NET 2003 used MSSCCI 1.2. Visual Studio 2005, 2008, and 2010 use MSSCCI Version 1.3, which adds support for rename and delete propagation, as well as asynchronous opening.[19]

Visual Studio supports running multiple instances of the environment (each with its own set of VSPackages). The instances use different registry hives (see MSDN''s definition of the term "registry hive" in the sense used here) to store their configuration state and are differentiated by their AppId (Application ID). The instances are launched by an AppId-specific .exe that selects the AppId, sets the root hive, and launches the IDE. VSPackages registered for one AppId are integrated with other VSPackages for that AppId. The various product editions of Visual Studio are created using the different AppIds. The Visual Studio Express edition products are installed with their own AppIds, but the Standard, Professional, and Team Suite products share the same AppId. Consequently, one can install the Express editions side-by-side with other editions, unlike the other editions which update the same installation. The professional edition includes a superset of the VSPackages in the standard edition, and the team suite includes a superset of the VSPackages in both other editions. The AppId system is leveraged by the Visual Studio Shell in Visual Studio 2008.', N'johnDoe089', N'VSCode.pngMon Nov 23 2020 18_55_31 GMT.png', N'Mon Nov 23 2020 18:55:56 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Author], [Banner_Image], [PostedOn]) VALUES (7, N'React vs Angular', N'1. Componentization
AngularJS comes with an extremely fixed and complex structure since it is based on three layers: Model, View, and Controller. With the AngularJS, developers break down the app’s code in different files. This allows reuse of templates or the component in different parts of the application. 

React, on the other hand, chooses a different architecture. It offers a simple way of developing component trees. The library comes with functional programming in which the component definitions are declarative. 

React codes are readable and logically structured. They do not ask developers to write code in a specific way. 

2. State Management 
An application uses states at multiple instances. The UI of an application is described by a component at any given point in time. The framework then re-renders the complete component UI when the data changes. This is how an application ensures that the data is updated. 

For handling state on React, it uses Redux as the solution, while in case of Angular Redux is not used. 

3. Self-Sufficiency 
The applications written in React call for additional libraries inclusion. Some of those are – React Router, Redux, or Helmet are used for optimizing the process of routing, state management, and interacting with the API. 

Between React or Angular, the latter is a full-fledged software development framework that does not need the inclusion of any library. Every function is implemented through the help of Angular package. 

4. Languages 
React is based on the JavaScript ES6+ language which is combined with the JSX script. JSX is mainly an extension for the syntax that makes the JavaScript code resemble ones which are written in HTML. Angular uses TypeScript or JavaScript. Since TypeScript is very compact it gets easier to navigate the code and spot the typos. 

5. UI Component 
Another differentiating point in Angular vs React is the UI component. The React UI tools are developed by its community. There are a number of paid and free UI components in the React portal. Angular comes with a built-in Material techstack and comes with a number of pre-built components of material design. Because of this, the UI configuration becomes extremely fast and simple. 

6. Directives 
The logic and templates in React are explained at the end of every component. It enables the readers to understand what the code means even without having to know its syntax. In case of Angular, the templates are returned with attributes and the syntax of Angular’s directives are sophisticated and complex, making it incomprehensible for the nascent developers. 

7. Toolset 
React makes use of multiple code editors like: Sublime Text, Atom, and Visual Studio. It uses the Create React App (CLI) tool for bootstrapping a project, while the server-side rendering is done with Next.js framework. For testing the app written in React, calls for multiple tools for different elements. 

Angular, like React, also uses different code editing tools like Sublime Text, Aptana, and Visual Studio. The project is set up using Angular CLI, while the server-side rendering is done through Angular Universal. 

But the point of difference between Angular and React technology is that Angular can be tested completely with only one tool. It can be either Karma, Protractor, or Jasmine.  It is also one of the noteworthy Angular advantages over React.

8. Popularity
As per Google Trends, React has more searches than Angular. While people show more interest in Angular due to availability of ample ready-made solutions, both the technologies are developing which means both are popular in the market. So for now, the answer to Angular vs React popularity would be equal on both sides, i.e Angular popularity = React popularity (at least in the current time). 

9. Architecture
Both Angular and React have component-based architecture, which means they have cohesive, reusable and modular components. But, the React and Angular difference comes at the point of tech stack. React architecture, on the other hand, uses JavaScript while Angular architecture goes with Typescript for web development which is more compact and error-free.

10. Learning Curve
Angular has a steep learning curve when compared to React. The Google Angular IO framework offers multiple ways to solve a particular problem, has a complex component management system, as well as demands familiarity with different concepts and languages like templates, pipes, dependency injection, RxJS, TypeScript, etc.', N'tasin', N'new.pngMon Nov 23 2020 21_00_40 GMT.png', N'Mon Nov 23 2020 21:02:20 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Author], [Banner_Image], [PostedOn]) VALUES (8, N'What is TypeScript?', N'TypeScript is an open-source language which builds on JavaScript, one of the world’s most used tools, by adding static type definitions.

Types provide a way to describe the shape of an object, providing better documentation, and allowing TypeScript to validate that your code is working correctly.

Writing types can be optional in TypeScript, because type inference allows you to get a lot of power without writing additional code.

All valid JavaScript code is also TypeScript code. You might get type-checking errors, but that won''t stop you from running the resulting JavaScript. While you can go for stricter behavior, that means you''re still in control.

TypeScript code is transformed into JavaScript code via the TypeScript compiler or Babel. This JavaScript is clean, simple code which runs anywhere JavaScript runs: In a browser, on Node.JS or in your apps.

Adopting TypeScript is not a binary choice, you can start by annotating existing JavaScript with JSDoc, then switch a few files to be checked by TypeScript and over time prepare your codebase to convert completely.

TypeScript’s type inference means that you don’t have to annotate your code until you want more safety.', N'tasin', N'1_KTh3puTlJIF6vAuUUu_LAQ.jpegMon Nov 23 2020 21_02_55 GMT.jpeg', N'Mon Nov 23 2020 21:03:58 GMT+0600 (Bangladesh Standard Time)')
SET IDENTITY_INSERT [dbo].[Posts] OFF
/****** Object:  Table [dbo].[Comments]    Script Date: 11/23/2020 22:16:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[postId] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[userName] [nvarchar](max) NULL,
	[commentedOn] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON
INSERT [dbo].[Comments] ([Id], [postId], [comment], [userName], [commentedOn]) VALUES (1, 1, N'that''s very good', N'ifti', N'Mon Nov 23 2020 18:07:35 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Comments] ([Id], [postId], [comment], [userName], [commentedOn]) VALUES (2, 3, N'good to know', N'sakib', N'Mon Nov 23 2020 18:20:16 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Comments] ([Id], [postId], [comment], [userName], [commentedOn]) VALUES (3, 1, N'great blog', N'sakib', N'Mon Nov 23 2020 18:20:32 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Comments] ([Id], [postId], [comment], [userName], [commentedOn]) VALUES (4, 1, N'ki lekhe eshob', N'masnad-E-ala', N'Mon Nov 23 2020 18:25:49 GMT+0600 (Bangladesh Standard Time)')
INSERT [dbo].[Comments] ([Id], [postId], [comment], [userName], [commentedOn]) VALUES (14, 1, N'very informative. would like to see more', N'johnDoe089', N'Mon Nov 23 2020 18:52:42 GMT+0600 (Bangladesh Standard Time)')
SET IDENTITY_INSERT [dbo].[Comments] OFF
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/23/2020 22:16:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201115113339_InitialDb', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201116132106_UsersTable', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201116134522_PostsTable', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201120043715_commentTable', N'3.1.10')
/****** Object:  Default [DF__Users__ban__014935CB]    Script Date: 11/23/2020 22:16:21 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0),0)) FOR [ban]
GO
