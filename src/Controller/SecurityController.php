<?php

// namespace App\Controller;

// use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
// use Symfony\Component\HttpFoundation\JsonResponse;
// use Symfony\Component\Routing\Annotation\Route;

// class SecurityController extends AbstractController
// {
//     #[Route('/security', name: 'app_security')]
//     public function index(): JsonResponse
//     {
//         return $this->json([
//             'message' => 'Welcome to your new controller!',
//             'path' => 'src/Controller/SecurityController.php',
//         ]);
//     }
// }


// src/Controller/SecurityController.php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;
use Symfony\Component\Security\Core\User\UserInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Component\Routing\Annotation\Route; // Add this line

class SecurityController extends AbstractController
{
    private $jwtManager;

    public function __construct(JWTTokenManagerInterface $jwtManager)
    {
        $this->jwtManager = $jwtManager;
    }

    /**
     * @Route("/api/login_check", name="api_login_check", methods={"POST"})
     */
    public function loginCheck(Request $request): JsonResponse
    {
        // Retrieve credentials from request body
        $credentials = json_decode($request->getContent(), true);

        // Perform authentication (e.g., check username/password)
        $user = $this->getDoctrine()->getRepository(User::class)->findOneBy(['username' => $credentials['username']]);

        if (!$user) {
            throw new BadCredentialsException('Invalid username or password');
        }

        // Example: Check password (you might want to use Symfony's built-in security mechanisms)
        $isValid = $this->isPasswordValid($user, $credentials['password']);

        if (!$isValid) {
            throw new BadCredentialsException('Invalid username or password');
        }

        // Generate JWT token
        $token = $this->jwtManager->create($user);

        // Return JWT token as JSON response
        return new JsonResponse(['token' => $token]);
    }

    private function isPasswordValid(UserInterface $user, string $password): bool
    {
        // Implement your password validation logic here
        // Example: Use Symfony's password encoder service
        $encoder = $this->get('security.password_encoder');
        return $encoder->isPasswordValid($user, $password);
    }
}
