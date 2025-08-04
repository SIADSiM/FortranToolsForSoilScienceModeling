#  Fortran Tools For Soil Science Modeling

This Fortran repository contains a collection of scientific routines for soil science modeling. The modules focus on key processes such as soil moisture balance, infiltration, temperature dynamics, nutrient cycling, and soil respiration. All algorithms are implemented based on peer-reviewed literature and established guidelines to ensure scientific accuracy and reproducibility.

The code is written in modern Fortran (Fortran 90+) and uses double precision for all floating-point calculations to ensure numerical stability.

## 🧩 Modules

The library includes the following modules:

*   **`SoilMoistureBalance_mod`**: Computes the daily soil water balance using the FAO-56 methodology.
*   **`InfiltrationGreenAmpt_mod`**: Implements the Green-Ampt model for calculating infiltration capacity.
*   **`SoilTemperatureProfile_mod`**: Simulates the soil temperature profile using the Fourier heat conduction equation.
*   **`NitrogenMineralization_mod`**: Estimates net nitrogen mineralization rates based on the CENTURY model approach.
*   **`SoilRespiration_mod`**: Calculates heterotrophic respiration rates using the Q10 temperature function.
*   **`BulkDensityCalc_mod`**: Computes soil bulk density from particle density and porosity.
*   **`SoilWaterRetention_mod`**: Implements the van Genuchten equation to estimate the soil water retention curve.
*   **`EvapotranspirationPenmanMonteith_mod`**: Calculates reference evapotranspiration using the FAO-56 Penman-Monteith equation.
*   **`SoilCarbonDecomposition_mod`**: Models soil organic carbon decomposition using first-order decay kinetics.
*   **`SoilErosionEstimate_mod`**: Provides a simplified soil erosion estimate using the Universal Soil Loss Equation (USLE) factors.

## 👷‍♂️Installation and Building

The project uses a `Makefile` for building the source code and running tests. The build process requires the Intel Fortran Compiler (`ifx`).

To build the test executable, run the following command in the root directory of the project:

```bash
make
```

This will compile all the source files and create an executable named `test_runner.exe`.

To run the test suite, execute:

```bash
make run_tests
```

To clean up all build artifacts, run:

```bash
make clean
```

## ⚓ Usage

The modules are designed to be easily integrated into other Fortran projects. To use a specific routine, you need to include the corresponding module with a `use` statement.

For example, to use the `BulkDensityCalc` subroutine:

```fortran
program my_model
  use kind_mod, only: dp
  use BulkDensityCalc_mod, only: BulkDensityCalc

  implicit none

  real(kind=dp) :: particle_density, porosity, bulk_density

  particle_density = 2650.0_dp
  porosity = 0.4_dp

  call BulkDensityCalc(particle_density, porosity, bulk_density)

  print *, "Calculated Bulk Density:", bulk_density

end program my_model
```

## 👨‍🔬 Scientific Background and Implementation Notes

The routines in this library are based on established models from the soil science literature. Each module's source file contains a reference to the primary literature source for the implemented algorithm.

### 📝 A Note on Exponentiation

To ensure cross-compiler consistency and avoid potential quirks in how different compilers handle floating-point exponentiation, non-integer power calculations (i.e., `x**y`) have been implemented using the `exp(y * log(x))` formulation. This is a standard practice in scientific computing to improve reproducibility.

## 📜 License

This project is licensed under a custom non-commercial license.

* ✅ **Free for personal, academic, and research use.**
* ❌ **Commercial use is strictly prohibited without a separate license.**

For commercial licensing inquiries, please contact me at ** s i a d s i m @ g m a i l . c o m  **.

## 📑 References

Allen, R.G., Pereira, L.S., Raes, D., & Smith, M. (1998). *Crop Evapotranspiration — Guidelines for computing crop water requirements*. FAO Irrigation and Drainage Paper 56.

Green, W.H. & Ampt, G.A. (1911). Studies on soil physics. *The Journal of Agricultural Science, 4*(1), 1-24.

Hillel, D. (1998). *Environmental Soil Physics*. Academic Press.

Lloyd, J. & Taylor, J.A. (1994). On the temperature dependence of soil respiration. *Functional Ecology, 8*(3), 315-323.

Parton, W.J., Schimel, D.S., Cole, C.V., & Ojima, D.S. (1987). Analysis of factors controlling soil organic matter levels in Great Plains grasslands. *Soil Science Society of America Journal, 51*(5), 1173-1179.

van Genuchten, M.T. (1980). A closed-form equation for predicting the hydraulic conductivity of unsaturated soils. *Soil Science Society of America Journal, 44*(5), 892-898.

Wischmeier, W.H., & Smith, D.D. (1978). *Predicting rainfall erosion losses*. USDA Agriculture Handbook 537.
