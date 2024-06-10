import { CatsModule } from './cats/cats.module';
import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';

@Module({
  imports: [
    MongooseModule.forRoot(
      'mongodb://root:1@localhost:27017/test?authSource=admin',
      {
        connectionFactory: (connection) => {
          console.log('MongoDB connected successfully!');
          return connection;
        },
      },
    ),
    CatsModule,
  ],
})
export class AppModule {}