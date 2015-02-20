#include <vexcl/vexcl.hpp>
int main() {
    vex::Context ctx(vex::Filter::Env);
    vex::vector<double> x(ctx, 1024);
    vex::vector<double> y(ctx, 1024);
    y = 2 * sin(M_PI * x) + 1;
}
