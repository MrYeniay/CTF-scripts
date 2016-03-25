#include <iostream>
#include <fstream>
#include <stdlib.h>

std::ifstream::pos_type filesize(const char* filename)
{
    std::ifstream in(filename, std::ifstream::ate | std::ifstream::binary);
    return in.tellg();
}

using namespace std;

int main(int argc, char **argv)
{
    char *buffer;
    int f_size;
    FILE *file;
    file=fopen(argv[1], "rb");
    f_size=filesize(argv[1]);
    buffer = (char*) malloc (sizeof(char)*f_size);

    if(argc==1){
        cout<<"parametre ile calistirin"<<endl;
        return 0;
    }

    if(argc==2){
        fread(buffer, 1, f_size, file );

        for(int i=f_size;i>=0;i--){
            cout<<buffer[i];
        }

        fclose(file);
    }

    if(argc==3){
        ofstream wfile;
        wfile.open(argv[2]);
        fread(buffer, 1, f_size, file );

        for(int i=f_size;i>=0;i--){
            wfile<<buffer[i];
        }

        wfile.close();

    }


    return 0;
}
